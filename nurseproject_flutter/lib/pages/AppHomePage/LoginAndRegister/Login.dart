import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../Commen/text_field.dart';
class Login extends StatefulWidget {
  Login({Key key, this.params}) : super(key: key);
  final params;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{

  // 选项卡控制器
  TabController _tabController;


  TextEditingController _nameYanController = TextEditingController();
  TextEditingController _namePassController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _vcodeController = TextEditingController();


  //分别定义两个输入框的焦点 用于切换焦点
  final FocusNode _nodeName = FocusNode();
  final FocusNode _nodePwd = FocusNode();
  final FocusNode _nodeVCode = FocusNode();
  bool _isClickYan = false;
  bool _isClickPass = false;

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
    _tabController = TabController(length: 2, vsync: this);

    _namePassController.addListener(_verifyPass);
    _passwordController.addListener(_verifyPass);

    _nameYanController.addListener(_verifyYan);
    _vcodeController.addListener(_verifyYan);
  }

  void _verifyYan() {
    String name = _nameYanController.text;
    print('name $name');
    String vcord = _vcodeController.text;
    print('验证码 $vcord');
    if (name.isEmpty || name.length < 11) {
      if(mounted) {
        LogUtil.d('-------7');
        setState(() {
          LogUtil.d('-------8');
          _isClickYan = false;
        });
      }
      return;
    }

    if (name.isEmpty || vcord.length < 4) {
      if(mounted) {
        LogUtil.d('-------9');
        setState(() {
          LogUtil.d('-------10');
          _isClickYan = false;
        });
      }
      return;
    }
    if(mounted) {
      LogUtil.d('-------11');
      setState(() {
        LogUtil.d('-------12');
        _isClickYan = true;
      });
    }
  }

  void _verifyPass() {
    String name = _namePassController.text;
    print('name $name');
    String password = _passwordController.text;
    print('password $password');
    if (name.isEmpty || name.length < 11) {
      if(mounted) {
        LogUtil.d('-------6');
        setState(() {
          _isClickPass = false;
          LogUtil.d('-------5');
        });
      }
      return;
    }

    if (password.isEmpty || password.length < 6) {
      if(mounted) {
        LogUtil.d('-------4');
        setState(() {
          LogUtil.d('-------3');
          _isClickPass = false;
        });
      }
      return;
    }
    if(mounted) {
      LogUtil.d('-------2');
      setState(() {
        LogUtil.d('-------1');
        _isClickPass = true;
      });
    }
  }

  _loginYan() {
    print('login action');
  }

  _loginPass() {
    print('login action');
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();


    _nameYanController.dispose();
    _passwordController.dispose();
    _namePassController.dispose();
    _vcodeController.dispose();
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
                           _buildYanZhengLogin(context),
                           _buildPasswordLogin(context),
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


  _buildYanZhengBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyTextField(
            focusNode: _nodeName,
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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  _buildPassBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          MyTextField(
            focusNode: _nodeName,
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
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _buildYanZhengLogin(BuildContext context){
      return Container(
        child: _buildYanZhengBody()
      );
  }

  Widget _buildPasswordLogin(BuildContext context){
      return Container(
          child:_buildPassBody()
      );
  }
}
