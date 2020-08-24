import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  Order({Key key, this.params}) : super(key: key);
  final params;
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单列表',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Text('订单列表页面'),
      ),
    );
  }
}
