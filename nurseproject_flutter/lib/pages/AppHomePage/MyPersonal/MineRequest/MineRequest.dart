import 'package:nurseproject_flutter/services/api.dart';
import '../../../../utils/util.dart';
import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
//import 'related_object_list_entity.dart';
import 'zong_xi_yi_model_entity.dart';

class MineRequest{
  static Future<dynamic> requestXiYia(String xiyi) async {
    Map resData = await requestXiYi(xiyi);
    LogUtil.d(resData);
    if(resData["success"] == 1){
      return JsonConvert.fromJsonAsT<ZongXiYiModelEntity>(resData);
    }else{
      return null;
    }
  }
}