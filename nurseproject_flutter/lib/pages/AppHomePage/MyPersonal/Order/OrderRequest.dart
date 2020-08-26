import 'package:nurseproject_flutter/services/api.dart';
import '../../../../utils/util.dart';
import './OrderItemModel.dart';
class OrderRequest{
    static Future<List<OrderItemModel>> requestAllOrderList(String token,int page) async {
    Map resData = await requestOrderList(token, page, 'all');
    LogUtil.d(resData);
//    final subjects = resData['data'];
//    return subjects;
    List<OrderItemModel> subjects = [];
    if(resData["success"] == 1){
      for(var item in resData["data"]["list"]){
        subjects.add(OrderItemModel.fromMap(item));
      }
      return subjects;
    }else{
      return null;
    }
  }
}