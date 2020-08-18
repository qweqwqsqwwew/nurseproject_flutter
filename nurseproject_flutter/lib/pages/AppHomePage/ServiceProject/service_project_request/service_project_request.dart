import 'package:flutter/material.dart';
import 'service_project_cate_model.dart';
import 'package:nurseproject_flutter/services/api.dart';
import 'package:nurseproject_flutter/utils/log_util.dart';

///获取服务项目左侧列表
class ServiceProjectCateRequest {

  static Future<List<ServiceCateItem>> requestServiceCateList() async {
    Map resData = await getServiceCateList();
    LogUtil.d(resData);
    final subjects = resData['data'];
    List<ServiceCateItem> cateList = [];
    for (var sub in subjects){
      cateList.add(ServiceCateItem.fromMap(sub));
    }
    return cateList;
  }

}