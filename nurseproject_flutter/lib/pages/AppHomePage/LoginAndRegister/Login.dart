import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import 'package:nurseproject_flutter/utils/storage.dart';
import '../../../utils/util.dart';
import '../Commen/text_field.dart';
import './LoginAndRegisterRequest/LoginRequest.dart';
import 'package:nurseproject_flutter/provider/appCommenNetData.dart';
import 'package:provider/provider.dart';
class Login extends StatefulWidget {
  Login({Key key, this.params}) : super(key: key);
  final params;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{

  // 选项卡控制器
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录',style: TextStyle(color: Colors.white),),
      ),
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
                },
             child:   Container(
               alignment: Alignment.topCenter,
               child: Container(
                 child: Column(
                   children: [
                     Container(
                       height: ScreenAdaper.height(120),
                       child: TabBar(controller: _tabController, tabs: [
                         Tab(text: "验证码登录",),
                         Tab(text: "密码登录",),
                       ],
                         isScrollable: true,
                         indicatorColor: Colors.orange,
                         indicatorWeight: 2,
                         indicatorSize: TabBarIndicatorSize.label,
                         indicatorPadding: EdgeInsets.only(bottom: 11.0),
                         labelColor: Colors.orange,
                         labelStyle: TextStyle(
                           fontSize: 18.0,
                         ),

                         unselectedLabelColor: Colors.black45,
                         unselectedLabelStyle: TextStyle(
                           fontSize: 18.0,
                         ),
                       ),
                     ),
                     Container(
                       height: ScreenAdaper.height(800),
                       child: TabBarView(
                         controller: _tabController,
                         children: <Widget>[
                           yanzheng(),
                           password(),
                         ],
                       ),
                     )
                   ],
                 ),
               ),
             ),
      ),
    );
  }
}

class yanzheng extends StatefulWidget {
  @override
  _yanzhengState createState() => _yanzhengState();
}

class _yanzhengState extends State<yanzheng>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  GainUserModel _userModelProvider;

  TextEditingController _nameYanController = TextEditingController();
  TextEditingController _vcodeController = TextEditingController();
  //分别定义两个输入框的焦点 用于切换焦点
  final FocusNode _nodeYanName = FocusNode();
  final FocusNode _nodeVCode = FocusNode();
  bool _isClickYan = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameYanController.addListener(_verifyYan);
    _vcodeController.addListener(_verifyYan);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameYanController.dispose();
    _vcodeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userModelProvider = Provider.of<GainUserModel>(context);

    return _buildYanZhengLogin(context);
  }

  Widget _buildYanZhengLogin(BuildContext context){
    return Container(
        child: _buildYanZhengBody()
    );
  }

  _loginYan() {
    print('login action');
    LoginBySMS.requestLoginBySMS(_nameYanController.text, _vcodeController.text).then((value){
      LogUtil.d(value);
//      Future.delayed(Duration(seconds: 10), () {
//        ToasrShow.show('加载存储数据');
//        var m = StorageUtil().getUserModel();
//        LogUtil.d(m);
//      });
      _userModelProvider.setCurrenUserModel();
      Navigator.pop(context);
    });
  }

  _sendSms(){
    LoginSendSMS.requestLoginSendSms(_nameYanController.text).then((value){
      LogUtil.d(value);
      if(value["success"] == 1){
        ToasrShow.show('短信发送成功');
      }else{
        ToasrShow.show('短信发送失败');
      }
    });
  }

  void _verifyYan() {
    String name = _nameYanController.text;
    print('name $name');
    String vcord = _vcodeController.text;
    print('验证码 $vcord');
    if (name.isEmpty || name.length < 11) {
        setState(() {
          _isClickYan = false;
        });
      return;
    }

    if (name.isEmpty || vcord.length < 4) {
        setState(() {
          _isClickYan = false;
        });
      return;
    }
      setState(() {
        _isClickYan = true;
      });
  }

  _buildYanZhengBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyTextField(
            focusNode: _nodeYanName,
            placeHolder: '请输入账号',
            maxLength: 11,
            keyboardType: TextInputType.phone,
            controller: _nameYanController,
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
            focusNode: _nodeVCode,
            placeHolder: '请输入验证码',
            maxLength: 6,
            controller: _vcodeController,
            keyboardType: TextInputType.phone,
            getVCode: () {
              print('获取验证码');
              _sendSms();
            },
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 25),
            height: 44,
            color: Colors.orange,
            child: FlatButton(
              disabledColor: Color(0xFFFFCC80),
              disabledTextColor: Color(0xFFFFE0B2),
              textColor: Colors.white,
              color: Colors.orange,
              //必填参数，按下按钮时触发的回调，接收一个方法，传null表示按钮禁用，会显示禁用相关样式
              onPressed: _isClickYan ? _loginYan : null,
              child: Text(
                '登录',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 16,
            alignment: Alignment.topRight,
            child: FlatButton(
              child: Text(
                '忘记密码',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              child: Text(
                '还没账号？快去注册',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4688FA),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/registerv',
                  arguments: {}, //　传递参数
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class password extends StatefulWidget {
  @override
  _passwordState createState() => _passwordState();
}

class _passwordState extends State<password>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  TextEditingController _namePassController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodePassName = FocusNode();
  final FocusNode _nodePwd = FocusNode();
  bool _isClickPass = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _namePassController.addListener(_verifyPass);
    _passwordController.addListener(_verifyPass);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _passwordController.dispose();
    _namePassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildPasswordLogin(context);
  }

  Widget _buildPasswordLogin(BuildContext context){
    return Container(
        child:_buildPassBody()
    );
  }

  void _verifyPass() {
    String name = _namePassController.text;
    print('name $name');
    String password = _passwordController.text;
    print('password $password');
    if (name.isEmpty || name.length < 11) {
        setState(() {
          _isClickPass = false;
        });
      return;
    }

    if (password.isEmpty || password.length < 6) {
        setState(() {
          _isClickPass = false;
        });
      return;
    }
      setState(() {
        _isClickPass = true;
      });
  }

  _loginPass() {
    print('login action');
  }

  _buildPassBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyTextField(
            focusNode: _nodePassName,
            placeHolder: '请输入账号',
            maxLength: 11,
            keyboardType: TextInputType.phone,
            controller: _namePassController,
          ),
          SizedBox(
            height: 25,
          ),
          MyTextField(
            focusNode: _nodePwd,
            placeHolder: '请输入密码',
            maxLength: 16,
            controller: _passwordController,
            isInputPwd: true,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 25),
            height: 44,
            color: Colors.orange,
            child: FlatButton(
              disabledColor: Color(0xFFFFCC80),
              disabledTextColor: Color(0xFFFFE0B2),
              textColor: Colors.white,
              color: Colors.orange,
              //必填参数，按下按钮时触发的回调，接收一个方法，传null表示按钮禁用，会显示禁用相关样式
              onPressed: _isClickPass ? _loginPass : null,
              child: Text(
                '登录',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 16,
            alignment: Alignment.topRight,
            child: FlatButton(
              child: Text(
                '忘记密码',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF999999),
                ),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            alignment: Alignment.center,
            child: FlatButton(
              child: Text(
                '还没账号？快去注册',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF4688FA),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/registerv',
                  arguments: {}, //　传递参数
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

