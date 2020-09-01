

import 'package:flutter/material.dart';
import 'order_detail_entity.dart';
import '../../../../utils/util.dart';
import '../RelatedObject_request/DottedLineWidget.dart';
import 'OrderRequest.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import 'pay_model_entity.dart';
import 'package:tobias/tobias.dart';

class PayPreOrder extends StatefulWidget {
  PayPreOrder({Key key, this.params}) : super(key: key);
  final OrderDetailEntity params;
  @override
  _PayPreOrderState createState() => _PayPreOrderState();
}

class _PayPreOrderState extends State<PayPreOrder> {

  String _payInfo = "";
  Map _payResult;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    isAliPayInstalled().then((data){
//      print("支付宝是否安装installed $data");
//    });
  }

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
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(100),bottom: ScreenAdaper.height(20)),
            child: Text("¥${widget.params.price}元",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(60),fontWeight: FontWeight.bold),),
          ),
          Text("${widget.params.itemName}   订单${widget.params.trade_number}",style: TextStyle(color: Colors.black45,fontSize: ScreenAdaper.sp(25)),),
          Container(),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(20),top: ScreenAdaper.height(30),bottom: ScreenAdaper.height(15)),
            alignment: Alignment.centerLeft,
            child: Text("订单费用",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(40)),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
            height: ScreenAdaper.height(60),
            alignment: Alignment.centerLeft,
            child: Text("项目费用:${widget.params.itemFee}",style: TextStyle(color: Colors.black45),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
//          Text("优惠费用:${widget.params.discountFee}"),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
            height: ScreenAdaper.height(60),
            alignment: Alignment.centerLeft,
            child: Text("优惠费用:${widget.params.discountFee}",style: TextStyle(color: Colors.black45),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
//          Text("交通费用:${widget.params.trafficFee}"),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
            height: ScreenAdaper.height(60),
            alignment: Alignment.centerLeft,
            child: Text("交通费用:${widget.params.trafficFee}",style: TextStyle(color: Colors.black45),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
//          Text("上门费用:${widget.params.homeFee}"),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
            height: ScreenAdaper.height(60),
            alignment: Alignment.centerLeft,
            child: Text("上门费用:${widget.params.homeFee}",style: TextStyle(color: Colors.black45),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
//          Text("耗材费用:${widget.params.materialFee}"),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
            height: ScreenAdaper.height(60),
            alignment: Alignment.centerLeft,
            child: Text("耗材费用:${widget.params.materialFee}",style: TextStyle(color: Colors.black45),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("asset/images/mine/alipay.png",width: ScreenAdaper.width(110),height: ScreenAdaper.width(110),),
                    Container(
                      margin: EdgeInsets.only(left: ScreenAdaper.width(15)),
                      child: Text("支付宝支付",style: TextStyle(color: Colors.black45),),
                    )
                  ],
                ),
                FlatButton(onPressed: (){}, child: Image.asset("asset/images/mine/paygou.png",width: ScreenAdaper.width(40),height: ScreenAdaper.width(40),),
                )
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
            margin: EdgeInsets.only(top: ScreenAdaper.height(100)),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
              child: Container(
                  width: ScreenAdaper.screenWidth() - ScreenAdaper.width(100),
                  color: Colors.orange,
                  height: ScreenAdaper.height(80),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Text('立即付款',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                    onTap: (){
                      LogUtil.d("付款");
                      final model = StorageUtil().getUserModel();
                      if (model != null) {
                        OrderRequest.requestAliPay( (model as UserModel).token, widget.params.trade_number).then((value){
                            _payInfo = (value as PayModelEntity).parameters;
                            callAlipay();
                        });
                      }
                    },
                  )
              ),
            ),
          )
        ],

      ),
    );
  }

  callAlipay() async {
    Map payResult;
    try {
      print("The pay info is : " + _payInfo);
      payResult = await aliPay(_payInfo);
      print("--->$payResult");
    } on Exception catch (e) {
      payResult = {};
    }

    if (!mounted) return;

    setState(() {
      _payResult = payResult;
    });
  }

}
