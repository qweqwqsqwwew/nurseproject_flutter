import 'package:flutter/material.dart';

class WaitPayOrder extends StatefulWidget {
  @override
  _WaitPayOrderState createState() => _WaitPayOrderState();
}

class _WaitPayOrderState extends State<WaitPayOrder>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('待付款订单'),
    );
  }
}
