import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'services/common_serivce.dart';
import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:nurseproject_flutter/utils/storage.dart';
import 'dart:io';

// 统一导出容器实例
export 'services/common_serivce.dart' show CommonService;

export 'package:nurseproject_flutter/utils/log_util.dart' show LogUtil;

export 'package:flutter_screenutil/screenutil.dart' show ScreenUtil;



GetIt locator = GetIt.instance;

// 注入容器函数
void setupLocator() {

  locator.registerLazySingleton<CommonService>(() => CommonService());

  setupStoreLocal().then((value) => null);
}

Future<void> setupStoreLocal() async {
  // 运行初始
  WidgetsFlutterBinding.ensureInitialized();

  await StorageUtil.init();
}
