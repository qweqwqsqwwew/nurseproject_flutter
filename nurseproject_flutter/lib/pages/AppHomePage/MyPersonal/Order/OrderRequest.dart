import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import 'package:nurseproject_flutter/services/api.dart';
import '../../../../utils/util.dart';
//import './OrderItemModel.dart';
import 'package:nurseproject_flutter/generated/json/order_model_entity_helper.dart';
import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import '../Order/order_model_entity.dart';
class OrderRequest{
    static Future<dynamic> requestAllOrderList(String token,int page) async {
    Map resData = await requestOrderList(token, page, 'all');
    LogUtil.d(resData);
    if(resData["success"] == 1){
    LogUtil.d("--------${JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"])}");
    return JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"]);
    }else{
      return null;
    }
  }
}