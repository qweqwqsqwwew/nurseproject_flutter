import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:provider/provider.dart';
import 'routes/onGenerateRoute.dart';
import 'routes/routesData.dart'; // 路由配置
import 'providers_config.dart'; // providers配置文件
import 'provider/themeStore.p.dart'; // 全局主题
import 'ioc/locator.dart' show setupLocator, locator, CommonService, LogUtil;
import 'package:ana_page_loop/ana_page_loop.dart' show anaAllObs;
import 'utils/myAppSetup/index.dart' show myAppSetup;
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
void main() {
  setupLocator();
  jhDebugMain(
    appChild: MultiProvider(
      providers: providersConfig,
      child: MyApp(),
    ),
    debugMode: DebugMode.inConsole,
  );
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    jhDebug.setGlobalKey = locator.get<CommonService>().getGlobalKey;
//    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    myAppSetup();
    return Consumer<ThemeStore>(
      builder: (context, themeStore, child) {
        return MaterialApp(
          builder:BotToastInit(),
          navigatorKey: jhDebug.getNavigatorKey,
          locale: const Locale('zh', 'CH'),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('zh', 'CH'),
            Locale('en', 'US'),
          ],
          theme: themeStore.getTheme,
          initialRoute: initialRoute,
          onGenerateRoute: onGenerateRoute, // 路由处理
          debugShowCheckedModeBanner: false,
          navigatorObservers: [...anaAllObs()],
        );
      },
    );
  }
}
