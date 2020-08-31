import 'package:flutter/material.dart';
import '../Order/order_detail_entity.dart';
import 'order_model_entity.dart';
import 'OrderRequest.dart';
import '../../../../utils/util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';


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
        child: Text('订单详情页面'),
      ),
    );
  }
}
