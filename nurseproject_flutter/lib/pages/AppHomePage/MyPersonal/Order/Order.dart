import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import './AllOrder.dart';
import './WaitPayOrder.dart';
import './WaitServiceOrder.dart';
import './CompleteOrder.dart';
import './WaitCommentOrder.dart';
import './BackMoneyOrder.dart';

class Order extends StatefulWidget {
  Order({Key key, this.params}) : super(key: key);
  final params;
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> with SingleTickerProviderStateMixin {


  // 选项卡控制器
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(initialIndex: widget.params["index"],length: 6, vsync: this,);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单列表',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Container(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: ScreenAdaper.height(100),
                  child: TabBar(controller: _tabController, tabs: [
                    Tab(text: "全部",),
                    Tab(text: "待付款",),
                    Tab(text: "待服务",),
                    Tab(text: "已完成",),
                    Tab(text: "待评论",),
                    Tab(text: "退款",),
                  ],
                    isScrollable: true,
                    indicatorColor: Colors.orange,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.only(bottom: 10.0),
                    labelColor: Colors.orange,
                    labelStyle: TextStyle(
                      fontSize: ScreenAdaper.sp(30),
                    ),

                    unselectedLabelColor: Colors.black45,
                    unselectedLabelStyle: TextStyle(
                      fontSize: ScreenAdaper.sp(30),
                    ),
                  ),
                ),
                Container(
                  height: ScreenAdaper.height(1037),
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      AllOrder(),
                      WaitPayOrder(),
                      WaitServiceOrder(),
                      CompleteOrder(),
                      WaitCommentOrder(),
                      BackMoneyOrder(),
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
