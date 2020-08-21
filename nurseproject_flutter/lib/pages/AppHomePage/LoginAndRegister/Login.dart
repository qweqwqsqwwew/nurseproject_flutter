import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class Login extends StatefulWidget {
  Login({Key key, this.params}) : super(key: key);
  final params;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin{

  // 选项卡控制器
  TabController _tabController;
  TextEditingController _unameController = new TextEditingController();

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
                       height: ScreenAdaper.height(440),
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

  Widget _buildYanZhengLogin(BuildContext context){
      return Container(
        child: Column(
          children: [
            Container(
              width: ScreenAdaper.screenWidth()- ScreenAdaper.width(90),
              child: TextFormField(
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "   手机号",
                      hintText: "   请输入手机号",
                      suffixIcon:Container(
                        child: RaisedButton(
                          child: Text('获取验证码'),
                          onPressed: () {},
                        ),
                      )
                  ),
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
            ),
            TextFormField(
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: "验证码",
                    hintText: "请输入验证码",
                ),
                //校验密码
                validator: (v) {
                  return v
                      .trim()
                      .length > 5 ? null : "密码不能少于6位";
                }
            ),
            Container(
              margin: EdgeInsets.only(top: ScreenAdaper.height(90)),
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
                child: Container(
                    width: ScreenAdaper.screenWidth() - ScreenAdaper.width(100),
                    color: Colors.orange,
                    height: ScreenAdaper.height(80),
                    alignment: Alignment.center,
                    child: GestureDetector(
                      child: Text('登录',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                      onTap: (){
                        Navigator.pushNamed(
                          context,
                          '/login',
                          arguments: {}, //　传递参数
                        );
                      },
                    )
                ),
              ),
            ),
          ],
        )
      );
  }

  Widget _buildPasswordLogin(BuildContext context){
      return Container(
          child: Column(
            children: [
              TextFormField(
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "手机号",
                      hintText: "请输入手机号",
                  ),
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
              TextFormField(
                  controller: _unameController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "请输入密码",
                  ),
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
            ],
          )
      );
  }
}
