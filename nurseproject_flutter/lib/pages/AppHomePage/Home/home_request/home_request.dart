import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/services/api.dart';
import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import '../ServiceObject/hospital_model_entity.dart';
import '../ServiceObject/hospitai_xi_yi_model_entity.dart';
class HomeBannerRequest {


  static Future<List<BannerItem>> requestHomeBannerAds() async {
    Map resData = await getHomeBannerData();
    LogUtil.d(resData);
    final subjects = resData['data'];
     List<BannerItem> imageData = [];
     if(resData['success'] == 1){
       for (var sub in subjects){
         imageData.add(BannerItem.fromMap(sub));
       }
     }
      return imageData;
  }
}

class HomeItemsRequest {
  static Future<List<HomeItem>> requestHomeItemsData() async {
    Map resData = await getHomeItemsData();
    LogUtil.d(resData);
    final subjects = resData['data'];
    List<HomeItem> itemsData = [];
    if (resData['success'] == 1){
      for (var sub in subjects){
        itemsData.add(HomeItem.fromMap(sub));
      }
      return itemsData;
    }else{
      return itemsData;
    }
  }
}

class HomeServiceInformationRequest{
  static Future<dynamic> requestHospitalData(String area_id,String item_id) async {
    Map resData = await requestHospital(area_id, item_id);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HospitalModelEntity>(resData["data"]);
    }else{
      return null;
    }
  }

  static Future<dynamic> requestHospitalXiYi(String hospital_id) async {
    Map resData = await requestHospitalXi(hospital_id);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<HospitaiXiYiModelEntity>(resData["data"]);
    }else{
      return null;
    }
  }

}

