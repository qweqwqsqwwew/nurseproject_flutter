
import 'package:flutter/material.dart';
import '../../../utils/util.dart';
//import '../../MyPersonal/RelatedObject_request/DottedLineWidget.dart';


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
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, index) {
              return _buildPageItem();
            })
      ),
    );
  }
  
  Widget _buildPageItem(){
    return Container(
      child: Column(
        children: [
          Text('诚信证明'),
          Text('本人对提供的材料进行了认真审核，保证所填写的信息和提供的材料真实有效，无任何虚假申报情况，若因本人所填写的造成申报材料虚假的，本人愿意承担由此带来的法律后果'),
          CheckboxListTile(
              value: false,
              title: Text('本人保证所填写的信息和提供材料真实有效'),
              onChanged: (bool){

          }),
          SizedBox(height: ScreenAdaper.height(100),),
          Text('评估对象'),
          Row(
            children: [
              Text('姓名'),
              Text('请选择评估对象'),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: Image.asset("asset/images/mine/jiantou.png",width: ScreenAdaper.width(25),height: ScreenAdaper.height(35),),
              )
            ],
          ),
        ],
      ),
    );
    
  }
}
