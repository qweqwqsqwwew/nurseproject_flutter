import 'package:get_it/get_it.dart';
import 'services/common_serivce.dart';
import 'package:nurseproject_flutter/utils/log_util.dart';

// 统一导出容器实例
export 'services/common_serivce.dart' show CommonService;

export 'package:nurseproject_flutter/utils/log_util.dart' show LogUtil;

GetIt locator = GetIt.instance;

// 注入容器函数
void setupLocator() {
  locator.registerLazySingleton<CommonService>(() => CommonService());
}
