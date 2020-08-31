import 'package:flutter/material.dart';
import '../RelatedObject_request/DottedLineWidget.dart';
import '../../../../utils/util.dart';
import '../Order/order_model_entity.dart';

class OrderItemWidget extends StatelessWidget {
  final OrderModelList _model;
  OrderItemWidget(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenAdaper.height(10),bottom: 1),
      padding: EdgeInsets.only(top: ScreenAdaper.height(10),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child: Container(
        padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0.0, 3.0), //阴影xy轴偏移量
                  blurRadius: 3.0, //阴影模糊程度
                  spreadRadius: 1.0 //阴影扩散程度
              )
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("订单编号:${this._model.tradeNo}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(27)),),
                Text("${this._model.statusText}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(27)),)
              ],
            ),
            DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 40,color: Colors.black45,),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: ScreenAdaper.width(15)),
                  child: Image.network(this._model.logo,width: ScreenAdaper.width(140),height: ScreenAdaper.width(170),),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(this._model.itemName,style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30),fontWeight: FontWeight.bold),),
                        Container(
                          margin: EdgeInsets.only(left: ScreenAdaper.width(80)),
                          child: Text("¥${this._model.price}元",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(50)),),
                        )
                      ],
                    ),
                    Container(
                      width: ScreenAdaper.width(500),
                      child: Text(this._model.intro,style: TextStyle(fontSize: ScreenAdaper.sp(30)),overflow: TextOverflow.ellipsis,maxLines: 1,),
                    ),
                    Container(
//                      alignment: Alignment.centerRight,
                      child: Text("x${this._model.itemNum}"),
                    )
                  ],
                ),
              ],
            ),
            DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(80),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 40,color: Colors.black45,),
            Container(
              alignment: Alignment.centerRight,
              child: Text("共${this._model.itemNum}件商品,合计¥${this._model.price}元(免邮)",style: TextStyle(color: Colors.black54),),
            ),
            DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(80),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 40,color: Colors.black45,),
            Container(
              alignment: Alignment.centerRight,
              child: OutlineButton(
                  onPressed: (){
                    LogUtil.d("点击了按钮");
                  },
                  child: Text("查看订单")
              ),
            )
          ],
        ),
      ),
    );
  }
  /// pay,service,comment,complete,refund
}
