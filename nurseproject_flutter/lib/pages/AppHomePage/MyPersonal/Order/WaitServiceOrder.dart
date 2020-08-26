import 'package:flutter/material.dart';


class WaitServiceOrder extends StatefulWidget {
  @override
  _WaitServiceOrderState createState() => _WaitServiceOrderState();
}

class _WaitServiceOrderState extends State<WaitServiceOrder>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('待服务订单'),
    );
  }
}
