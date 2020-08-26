import 'package:dio/dio.dart';
import '../utils/dio/safeRequest.dart';
import 'service_url.dart';

/// 获取APP最新版本号, 演示更新APP组件
Future<Map> getNewVersion([String version]) async {
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

///注册
Future<Map> register(String source_str,String code,String mobile,String password) async{
  Map resData = await safeRequest(
    serviceUrl['app_register'],
    data: {
      'app':source_str,
      'code':code,
      'mobile':mobile,
      'password':password
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};
}

///发送登录短信
Future<Map> loginSendSms(String phone_str) async {
  Map resData = await safeRequest(
    serviceUrl['app_login_sendSMS'],
    data: {
      'appid':2,
      'mobile':phone_str,
      'scope':'login'
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};
}

///登录接口
Future<Map> loginBySMS(String mobild_str,String vcode) async{
  Map resData = await safeRequest(
    serviceUrl['app_login_bySMS'],
    data: {
      'code':vcode,
      'mobile':mobild_str,
      'app':'user'
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};

}

///通过密码登录
Future<Map> loginByPass(String mobild_str,String password) async{
  Map resData = await safeRequest(
    serviceUrl['app_login_byPASS'],
    data: {
      'password':password,
      'mobile':mobild_str,
      'app':'user'
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};
}

///获取关联对象列表
Future<Map> requestRelateddObjectList(String token) async{
  Map resData = await safeRequest(
    serviceUrl['app_relatedObject'],
    data: {
      'token':token
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};
}

///获取全部订单列表
Future<Map> requestOrderList(String token,int page,String tab_string) async{
  Map resData = await safeRequest(
    serviceUrl['app_order'],
    data: {
      'token':token,
      'page':page,
      'tab':tab_string
    },
    options: Options(method: 'POST'),
  );
  return resData ?? {};
}