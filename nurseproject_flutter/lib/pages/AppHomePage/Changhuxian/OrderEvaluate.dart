
import 'package:flutter/material.dart';
import '../../../utils/util.dart';

class OrderEvaluate extends StatefulWidget {
  OrderEvaluate({Key key, this.params}) : super(key: key);
  final params;
  @override
  _OrderEvaluateState createState() => _OrderEvaluateState();
}

class _OrderEvaluateState extends State<OrderEvaluate> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('预约评估',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Text('预约评估界面'),
      ),
    );
  }
}
