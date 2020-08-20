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
    _tabController = TabController(length: 5, vsync: this);
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
          margin: EdgeInsets.only(top: ScreenAdaper.height(100)),
          child: Column(
              children: [
                TabBar(controller: _tabController, tabs: [
                  Tab(text: "鉴定",),
                  Tab(text: "古玩",),
                  Tab(text: "瓷器",),
                  Tab(text: "收藏",),
                  Tab(text: "乐趣",),
                ],
                  isScrollable: true,
                  indicatorColor: Color(0xffff0000),
                  indicatorWeight: 1,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.only(bottom: 10.0),
//                  labelPadding: EdgeInsets.only(left: 20),
                  labelColor: Color(0xff333333),
                  labelStyle: TextStyle(
                    fontSize: 15.0,
                  ),
                  unselectedLabelColor: Colors.yellowAccent,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    Text('鉴定'),
                    Text('古玩'),
                    Text('瓷器'),
                    Text('收藏'),
                    Text('乐趣'),
                  ],
                ),
              ],
          ),
        ),
      ),
    );
  }
}
