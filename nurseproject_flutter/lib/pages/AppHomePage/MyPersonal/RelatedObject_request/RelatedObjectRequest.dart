import 'package:nurseproject_flutter/services/api.dart';
import '../../../../utils/util.dart';
import './RelatedObjectItemModel.dart';

class RelatedObjectRequest{
  static Future<List<RelatedObjectItemModel>> requestRelatedObjectList(String token) async {
    Map resData = await requestRelateddObjectList(token);
    LogUtil.d(resData);
//    final subjects = resData['data'];
//    return subjects;
    List<RelatedObjectItemModel> subjects = [];
    if(resData["success"] == 1){
      for(var item in resData["data"]){
        subjects.add(RelatedObjectItemModel.fromMap(item));
      }
      return subjects;
    }else{
      return null;
    }
  }
}