import 'package:dio/dio.dart';
import '../utils/dio/safeRequest.dart';
import 'service_url.dart';

/// 获取APP最新版本号, 演示更新APP组件
Future<Map> getNewVersion([String version]) async {
  // TODO: 替换为你的真实请求接口，并返回数据，此处演示直接返回数据
  // Map resData = await safeRequest(
  //   'url',
  //   options: Options(method: 'GET'), // 请求类型
  // );
  Map resData = {
    "code": "0",
    "message": "success",
    "data": {
      "version": "2.2.4",
      "info": ["修复bug提升性能", "增加彩蛋有趣的功能页面", "测试功能"]
    }
  };

  return resData['data'] ?? {};
}

/// 获取首页轮播图数据
Future<Map> getHomeBannerData() async {
  Map resData = await safeRequest(
    serviceUrl['app_home_banner'],
    data: {}, // 传递参数
    options: Options(method: 'GET'),
  );
  return resData ?? {};
}

///获取首页列表数据
Future<Map> getHomeItemsData() async {
  Map resData = await safeRequest(
    serviceUrl['app_home_items'],
    data: {
      'cate_id':0,
      'city_id':3205
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};

}

///获取首页item点击详情数据
Future<Map> getHomeItemDetailData(String itemID,int locationID) async {
  Map resData = await safeRequest(
    serviceUrl['app_home_item_detail'] + itemID,
    data: {
      'city_id':locationID
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};
}

///获取项目服务左侧名列表
Future<Map> getServiceCateList() async{
  Map resData = await safeRequest(
    serviceUrl['app_service_project_cate_list'],
    data: {},
    options: Options(method: 'GET'),
  );
  return resData ?? {};
}
