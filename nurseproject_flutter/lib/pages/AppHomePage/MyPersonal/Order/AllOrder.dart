import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import './OrderItemModel.dart';
import './OrderRequest.dart';
import '../../../../utils/util.dart';
import './OrderItemWidget.dart';
import '../Order/order_model_entity.dart';

class AllOrder extends StatefulWidget {
  @override
  _AllOrderState createState() => _AllOrderState();
}

class _AllOrderState extends State<AllOrder> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  List<OrderModelList> _dataList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final model = StorageUtil().getUserModel();
    if (model != null){
      OrderRequest.requestAllOrderList((model as UserModel).token, 1).then((value){
        _dataList = [];
        LogUtil.d(value);
        setState(() {
          _dataList.addAll((value as OrderModelEntity).xList);
        });
      });
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _dataList.length,
        itemBuilder: (ctx, index) {
          return OrderItemWidget(_dataList[index]);
        });
  }
}
