import 'package:flutter/material.dart';

class BackMoneyOrder extends StatefulWidget {
  @override
  _BackMoneyOrderState createState() => _BackMoneyOrderState();
}

class _BackMoneyOrderState extends State<BackMoneyOrder>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('推款订单'),
    );
  }
}
