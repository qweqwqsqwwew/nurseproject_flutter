import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import '../config/themes/index_theme.dart';

// Provider状态管理使用
class ThemeStore with ChangeNotifier {
  ThemeData _themeData = themeCommenOrange;

  // 更新全局主题样式
  void setTheme(ThemeData themeName) {
    _themeData = themeName;
    notifyListeners();
  }

  ThemeData get getTheme => _themeData;
}

