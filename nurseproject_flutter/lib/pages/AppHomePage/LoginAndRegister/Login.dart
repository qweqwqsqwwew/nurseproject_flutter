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
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          margin: EdgeInsets.only(top: ScreenAdaper.height(70)),
          child: Column(
              children: [
                Container(
                  height: ScreenAdaper.height(100),
                  child: TabBar(controller: _tabController, tabs: [
                    Tab(text: "验证码登录",),
                    Tab(text: "密码登录",),
                  ],
                    isScrollable: true,
                    indicatorColor: Colors.orange,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(bottom: 10.0),
//                  labelPadding: EdgeInsets.only(left: 20),
                    labelColor: Colors.orange,
                    labelStyle: TextStyle(
                      fontSize: 18.0,
                    ),
                    unselectedLabelColor: Colors.black45,
                    unselectedLabelStyle: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                Container(
                  height: ScreenAdaper.height(600),
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      Text('验证码登录'),
                      Text('密码登录'),
                    ],
                  ),
                )
              ],
          ),
        ),
      ),
    );
  }

  Widget _buildYanZhengLogin(BuildContext context){

  }

  Widget _buildPasswordLogin(BuildContext context){

  }
}
