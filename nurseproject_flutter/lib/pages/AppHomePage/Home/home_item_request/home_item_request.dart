import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/services/api.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_item_request/home_item_detail_model.dart';

///获取item详情页数据
class HomeItemRequest{
  static Future<ItemDetail> requestItemDetail(String itemID,int locationID) async {
    Map resData = await getHomeItemDetailData(itemID, locationID);
    LogUtil.d(resData);
    final subject = resData['data'];
    final itemDetail = ItemDetail.fromMap(subject);
    return itemDetail;
  }
}