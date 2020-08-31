

import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import './OrderRequest.dart';
import '../../../../utils/util.dart';
import './OrderItemWidget.dart';
import '../Order/order_model_entity.dart';

class WaitServiceOrder extends StatefulWidget {
  @override
  _WaitServiceOrderState createState() => _WaitServiceOrderState();
}

class _WaitServiceOrderState extends State<WaitServiceOrder> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  int currentPageIndex = 1;

  List<OrderModelList> _dataList = [];

  ///下拉刷新
  ScrollController _scrollController;
  bool isLoading = false;

  void getListData(int index){
    if(index == 1){
      final model = StorageUtil().getUserModel();
      if (model != null){
        OrderRequest.requestServiceOrderList((model as UserModel).token, 1).then((value){
          _dataList = [];
          LogUtil.d(value);
          currentPageIndex = currentPageIndex + 1;
          setState(() {
            _dataList.addAll((value as OrderModelEntity).xList);
          });
        });
      }
    }else{
      final model = StorageUtil().getUserModel();
      if (model != null){
        OrderRequest.requestServiceOrderList((model as UserModel).token, index).then((value){
          LogUtil.d(value);
          if(((value as OrderModelEntity).xList).length > 0){
            currentPageIndex = currentPageIndex + 1;
            setState(() {
              _dataList.addAll((value as OrderModelEntity).xList);
            });
          }else{
            ToasrShow.show('没有数据，不要再滑了');
          }
        });
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData(1);
    ///初始化下拉加载
    _scrollController = ScrollController();
    // 监听ListView是否滚动到底部
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        // 这里可以执行上拉加载逻辑
        getListData(currentPageIndex);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  Future<Null> _handleRefresh() async {
    getListData(1);
    Future.delayed(Duration(seconds: 1), () {
      ToasrShow.show('加载成功');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        child: ListView.builder(
            controller: _scrollController,
            itemCount: _dataList.length,
            itemBuilder: (ctx, index) {
              return OrderItemWidget(_dataList[index]);
            }),
        onRefresh: _handleRefresh,
      ),
    );
  }
}
