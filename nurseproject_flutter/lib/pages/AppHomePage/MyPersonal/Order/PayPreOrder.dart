import 'package:flutter/material.dart';
import 'order_detail_entity.dart';

class PayPreOrder extends StatefulWidget {
  PayPreOrder({Key key, this.params}) : super(key: key);
  final OrderDetailEntity params;
  @override
  _PayPreOrderState createState() => _PayPreOrderState();
}

class _PayPreOrderState extends State<PayPreOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("支付订单"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, index) {
              return _buildItemWidget();
            }),
      ),
    );
  }


  Widget _buildItemWidget(){
    return Container(
      child: Column(
        children: [

        ],
      ),
    );
  }

}
