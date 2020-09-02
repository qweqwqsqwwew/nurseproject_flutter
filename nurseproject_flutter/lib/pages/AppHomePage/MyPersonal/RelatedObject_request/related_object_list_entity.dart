import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import 'package:nurseproject_flutter/generated/json/base/json_field.dart';

class RelatedObjectListEntity with JsonConvert<RelatedObjectListEntity> {
	int success;
	String msg;
	int code;
	List<RelatedObjectListData> data;
}

class RelatedObjectListData with JsonConvert<RelatedObjectListData> {
	int id;
	String realname;
	String mobile;
	@JSONField(name: "card_no")
	String cardNo;
	int sex;
	String birthday;
	@JSONField(name: "area_id")
	int areaId;
	@JSONField(name: "city_id")
	int cityId;
	@JSONField(name: "area_name")
	String areaName;
	String address;
	String disease;
	String allergy;
	String relation;
	String avatar;
}
