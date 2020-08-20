import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import 'package:nurseproject_flutter/services/api.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';

class RegisterRequest{
  static Future<List<BannerItem>> requestRegister(String source_str,String code,String mobile,String password) async {
    Map resData = await register(source_str,code,mobile,password);
    LogUtil.d(resData);
    final subjects = resData['data'];
//    List<BannerItem> imageData = [];
//    for (var sub in subjects){
//      imageData.add(BannerItem.fromMap(sub));
//    }
    return subjects;
  }
}

