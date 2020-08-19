import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/Home.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_request.dart';
// Provider状态管理使用
class ServiceItemList with ChangeNotifier {
  List<HomeItem> _serviceList = [];

  List<HomeItem> get getserviceList => _serviceList;

  void getServiceItemsList(){
    HomeItemsRequest.requestHomeItemsData().then((res){
      _serviceList = [];
      _serviceList.addAll(res);
      notifyListeners();
    });
  }
//  ServiceItemList get serviceList => _serviceList;

  ///服务列表点击index
  int _currenClickIndex = 0;
  int get getCurrentCllickIndex => _currenClickIndex;
  void setCurrentClickIndex(int index){
    _currenClickIndex = index;
    notifyListeners();
  }
}