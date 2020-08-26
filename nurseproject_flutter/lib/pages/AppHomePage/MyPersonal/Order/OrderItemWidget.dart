import 'package:flutter/material.dart';
import './OrderItemModel.dart';
import '../RelatedObject_request/DottedLineWidget.dart';
import '../../../../utils/util.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderItemModel _model;
  OrderItemWidget(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Text("订单编号:${this._model.trade_no}"),
                Text("${this._model.status_text}")
              ],
            ),
            DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,),
            Row(
              children: [
                Image.network(this._model.logo,width: ScreenAdaper.width(50),height: ScreenAdaper.width(50),),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(this._model.item_name),
                        Text("¥${this._model.price}元"),
                      ],
                    ),
                    Text(this._model.intro),
                    Text("x${this._model.item_num}")
                  ],
                ),
              ],
            ),
            DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(80),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 40,color: Colors.black45,),
            Text("共${this._model.item_num}件商品,合计¥${this._model.price}元(免邮)"),
            DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(80),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 40,color: Colors.black45,),
            FlatButton(
                onPressed: (){
                  LogUtil.d("点击了按钮");
                },
                child: Text("查看订单")
            )
          ],
        ),
      ),
    );
  }
  
}
