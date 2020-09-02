import 'package:nurseproject_flutter/services/api.dart';
import '../../../../utils/util.dart';
import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import 'related_object_list_entity.dart';

class RelatedObjectRequest{
  static Future<dynamic> requestRelatedObjectList(String token) async {
    Map resData = await requestRelateddObjectList(token);
    LogUtil.d(resData);
    if(resData["success"] == 1){
      return JsonConvert.fromJsonAsT<RelatedObjectListEntity>(resData);
    }else{
      return null;
    }
  }
}