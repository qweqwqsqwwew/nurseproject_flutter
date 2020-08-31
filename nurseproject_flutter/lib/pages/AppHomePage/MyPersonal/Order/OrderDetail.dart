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
              itemCount: 1,
              itemBuilder: (ctx, index) {
                return _buildItem();
              })
      ),
    );
  }

  Widget _buildItem() {
    return Container(
      child: Column(
        children: [
          Text("商品信息"),
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
                this._detailParams.logo, width: ScreenAdaper.width(100),
                height: ScreenAdaper.height(100),),
              Column(
                children: [
                  Row(
                    children: [
                      Text(this._detailParams.itemName),
                      Text("¥${this._detailParams.price}元"),
                    ],
                  ),
                  Row(
                    children: [
                      Text(this._detailParams.intro),
                      Text("x${this._detailParams.itemNum}"),
                    ],
                  ),
                  Text("此服务包含基础服务费${this._detailParams.trafficFee}元"),
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

          ),
          Text("费用明细"),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            children: [
              Text("优惠费用：${this._detailParams.discountFee}元"),
              Text("交通费用：${this._detailParams.trafficFee}元"),
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
            children: [
              Text("上门费用：${this._detailParams.homeFee}元"),
              Text("耗材费用：${this._detailParams.materialFee}元"),
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

          ),
          Row(
            children: [
              Text("订单信息"),
              Text(this._detailParams.statusText)
            ],
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Text("订单编号：${widget.params.tradeNo}"),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Text("下单时间：${this._detailParams.createdAt}"),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Text("服务时间：${this._detailParams.serviceAt}"),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            children: [
              Text("服务机构：${this._detailParams.hospitalName}"),
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
            children: [
              Text("服务人员：${this._detailParams.nurseName}"),
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
