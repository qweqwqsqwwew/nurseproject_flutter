import 'package:flutter/material.dart';


class CompleteOrder extends StatefulWidget {
  @override
  _CompleteOrderState createState() => _CompleteOrderState();
}

class _CompleteOrderState extends State<CompleteOrder>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('完成订单'),
    );
  }
}
