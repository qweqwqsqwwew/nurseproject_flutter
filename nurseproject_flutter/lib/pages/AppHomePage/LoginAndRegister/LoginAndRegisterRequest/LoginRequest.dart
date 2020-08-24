//import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import 'package:nurseproject_flutter/services/api.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/utils/storage.dart';
import '../../../../utils/util.dart';

class RegisterRequest{
  static Future<List<BannerItem>> requestRegister(String source_str,String code,String mobile,String password) async {
    Map resData = await register(source_str,code,mobile,password);
    LogUtil.d(resData);
    final subjects = resData['data'];
    return subjects;
  }
}

class LoginSendSMS{
  static Future<Map> requestLoginSendSms(String phone_str) async {
    Map resData = await loginSendSms(phone_str);
    LogUtil.d(resData);
    final subject = resData;
    return subject;
  }
}

class LoginBySMS{
  static Future<UserModel> requestLoginBySMS(String mobile_str,String vcode) async{
    Map resData = await loginBySMS(mobile_str, vcode);
    LogUtil.d(resData);
    final subject = resData['data'];
    if(resData['success'] == 1){
      StorageUtil().setUserJSON(resData['data']);
      return UserModel.fromMap(subject);
    }else{
      return null;
    }
  }
}

class LoginByPass{
  static Future<UserModel> requestLoginByPASS(String mobile_str,String pass_word_str) async{
    Map resData = await loginByPass(mobile_str, pass_word_str);
    LogUtil.d(resData);
    final subject = resData['data'];
    if(resData['success'] == 1){
      StorageUtil().setUserJSON(resData['data']);
      return UserModel.fromMap(subject);
    }else{
      return null;
    }
  }
}
