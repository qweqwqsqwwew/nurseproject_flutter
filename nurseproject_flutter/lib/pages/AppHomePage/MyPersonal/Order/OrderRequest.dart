import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import 'package:nurseproject_flutter/services/api.dart';
import '../../../../utils/util.dart';
import '../Order/order_model_entity.dart';
import '../Order/order_detail_entity.dart';
import '../Order/pay_model_entity.dart';
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
    ///待付款
    static Future<dynamic> requestPayOrderList(String token,int page) async {
      Map resData = await requestOrderList(token, page, 'pay');
      LogUtil.d(resData);
      if(resData["success"] == 1){
        LogUtil.d("--------${JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"])}");
        return JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"]);
      }else{
        return null;
      }
    }
    ///待服务
    static Future<dynamic> requestServiceOrderList(String token,int page) async {
      Map resData = await requestOrderList(token, page, 'service');
      LogUtil.d(resData);
      if(resData["success"] == 1){
        LogUtil.d("--------${JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"])}");
        return JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"]);
      }else{
        return null;
      }
    }
    ///完成
    static Future<dynamic> requestCompleteOrderList(String token,int page) async {
      Map resData = await requestOrderList(token, page, 'complete');
      LogUtil.d(resData);
      if(resData["success"] == 1){
        LogUtil.d("--------${JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"])}");
        return JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"]);
      }else{
        return null;
      }
    }
    ///退款
    static Future<dynamic> requestRefundOrderList(String token,int page) async {
      Map resData = await requestOrderList(token, page, 'refund');
      LogUtil.d(resData);
      if(resData["success"] == 1){
        LogUtil.d("--------${JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"])}");
        return JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"]);
      }else{
        return null;
      }
    }
    ///评论
    static Future<dynamic> requestCommentOrderList(String token,int page) async {
      Map resData = await requestOrderList(token, page, 'comment');
      LogUtil.d(resData);
      if(resData["success"] == 1){
        LogUtil.d("--------${JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"])}");
        return JsonConvert.fromJsonAsT<OrderModelEntity>(resData["data"]);
      }else{
        return null;
      }
    }

    ///订单详情
    static Future<dynamic> requestOrderdetail(String token,String trade_no) async {
      Map resData = await requestOrderDetail(token, trade_no);
      LogUtil.d(resData);
      if(resData["success"] == 1){
        LogUtil.d("--------${JsonConvert.fromJsonAsT<OrderDetailEntity>(resData["data"])}");
        return JsonConvert.fromJsonAsT<OrderDetailEntity>(resData["data"]);
      }else{
        return null;
      }
    }

    ///订单预付款
    static Future<dynamic> requestAliPay(String token,String trade_no) async {
      Map resData = await requestAliPayStr(token, trade_no);
      LogUtil.d(resData);
      if(resData["success"] == 1){
        LogUtil.d("--------${JsonConvert.fromJsonAsT<PayModelEntity>(resData["data"])}");
        return JsonConvert.fromJsonAsT<PayModelEntity>(resData["data"]);
      }else{
        return null;
      }
    }
}