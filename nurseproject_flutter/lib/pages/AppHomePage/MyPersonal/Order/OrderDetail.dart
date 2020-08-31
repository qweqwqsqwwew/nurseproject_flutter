

import 'package:flutter/material.dart';
import '../Order/order_detail_entity.dart';
import 'order_model_entity.dart';
import 'OrderRequest.dart';
import '../../../../utils/util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import '../RelatedObject_request/DottedLineWidget.dart';

class OrderDetail extends StatefulWidget {
  OrderDetail({Key key, this.params}) : super(key: key);
  final OrderModelList params;
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {

  OrderDetailEntity _detailParams;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final model = StorageUtil().getUserModel();
    if (model != null) {
      OrderRequest.requestOrderdetail(
          (model as UserModel).token, widget.params.tradeNo).then((value) {
        LogUtil.d(value);
        setState(() {
          _detailParams = value;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('订单详情'),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: _detailParams == null?0:1,
              itemBuilder: (ctx, index) {
                return _buildItem();
              })
      ),
    );
  }

  Widget _buildItem() {
    return Container(
      padding: EdgeInsets.only(left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),top: ScreenAdaper.height(20)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            height: ScreenAdaper.height(60),
            child: Text("商品信息",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            children: [
              Image.network(
                this._detailParams.logo, width: ScreenAdaper.width(150),
                height: ScreenAdaper.height(170),),
              Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
//                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(this._detailParams.itemName,style:TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: ScreenAdaper.sp(30)),),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenAdaper.width(70)),
                        child: Text("¥${this._detailParams.price}元",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(50)),),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                    child: Row(
                      children: [
                        Container(
                          width: ScreenAdaper.width(500),
                          child: Text(this._detailParams.intro,style: TextStyle(color: Colors.black54),overflow: TextOverflow.ellipsis,maxLines: 1,),
                        ),
                        Text("x${this._detailParams.itemNum}"),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                    alignment: Alignment.centerRight,
                    child: Text("此服务包含基础服务费${this._detailParams.trafficFee}元",style: TextStyle(color: Colors.black54),),
                  )
                ],
              ),
            ],
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFFE0B2),
          ),
          Container(
            height: ScreenAdaper.height(60),
            margin: EdgeInsets.only(top: ScreenAdaper.height(15)),
            alignment: Alignment.centerLeft,
            child: Text("费用明细",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(35),fontWeight: FontWeight.bold),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("优惠费用：${this._detailParams.discountFee}元",style: TextStyle(color: Colors.black54),),
              Text("交通费用：${this._detailParams.trafficFee}元",style: TextStyle(color: Colors.black54),),
            ],
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("上门费用：${this._detailParams.homeFee}元",style: TextStyle(color: Colors.black54),),
              Text("耗材费用：${this._detailParams.materialFee}元",style: TextStyle(color: Colors.black54),),
            ],
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
              height: ScreenAdaper.height(10),
              color: Color(0xFFFFE0B2),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
            height: ScreenAdaper.height(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("订单信息",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(35),fontWeight: FontWeight.bold),),
                Text(this._detailParams.statusText)
              ],
            ),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("订单编号：${widget.params.tradeNo}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("下单时间：${this._detailParams.createdAt}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("服务时间：${this._detailParams.serviceAt}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("服务机构：${this._detailParams.hospitalName}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                        children: _getGradeStar(this._detailParams.nurseStar.toDouble(), 5)
                    )
                  ],
                ),
              ),
            ],
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("服务人员：${this._detailParams.nurseName}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(30)),),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                        children: _getGradeStar(this._detailParams.nurseStar.toDouble(), 5)
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _getGradeStar(double score, int total) {
    List<Widget> _list = List<Widget>();
    for (var i = 0; i < total; i++) {
      double factor = (score - i);
      if (factor >= 1) {
        factor = 1.0;
      }else if (factor < 0){
        factor = 0;
      }
      Stack _st = Stack(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Colors.grey,
          ),
          ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: factor,
                child: Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                ),
              )
          )
        ],
      );
      _list.add(_st);
    }
    return _list;
  }
}
