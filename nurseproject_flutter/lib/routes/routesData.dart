import 'package:flutter/material.dart';
import 'routeName.dart';
import '../pages/ErrorPage/ErrorPage.dart';
import '../pages/AppHomePage/AppHomePage.dart';
import '../pages/SplashPage/SplashPage.dart';
import '../pages/TestDemo/TestDemo.dart';
import '../pages/AppHomePage/Home/HomeItemDetail.dart';
import '../pages/AppHomePage/Commen/CommenWebview.dart';
import '../pages/AppHomePage/LoginAndRegister/RegisterP.dart';
import '../pages/AppHomePage/LoginAndRegister/Login.dart';
import '../pages/AppHomePage/MyPersonal/PersonalSetting.dart';
import '../pages/AppHomePage/MyPersonal/RelatedObject.dart';
import '../pages/AppHomePage/Changhuxian/OrderEvaluate.dart';
import '../pages/AppHomePage/MyPersonal/Order/Order.dart';

final String initialRoute = '/'; // 初始默认显示的路由
final Map<String, WidgetBuilder> routesData = {
  // 页面路由定义...
  RouteName.splashPage: (BuildContext context, {params}) => SplashPage(),
  RouteName.appHomePage: (BuildContext context, {params}) => AppHomePage(params: params),
  RouteName.error: (BuildContext context, {params}) =>
      ErrorPage(params: params),
  RouteName.testDemo: (BuildContext context, {params}) =>
      TestDemo(params: params),
  ///主页点击详情页
  RouteName.homeItemDetail:(BuildContext context,{params}) =>  HomeItemDetail(params: params),
  ///公共网页
  RouteName.commmenWebview:(BuildContext context,{params}) => CommenWebview(params: params,),
  ///注册页面
  RouteName.registerV:(BuildContext context,{params}) => RegisterP(params: params,),
  ///登录页面
  RouteName.login:(BuildContext context,{params}) => Login(params:params),
  ///个人设置页面
  RouteName.personalSetting:(BuildContext context,{params}) => PersonalSetting(params:params),
  ///关联对象界面
  RouteName.relatedObject:(BuildContext context,{params}) => RelatedObject(params:params),
  ///预约评估界面
  RouteName.orderEvaluate:(BuildContext context,{params}) => OrderEvaluate(params:params),
  ///订单页面
  RouteName.order:(BuildContext context,{params}) => Order(params:params),
};
