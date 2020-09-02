import 'package:nurseproject_flutter/pages/AppHomePage/MyPersonal/RelatedObject_request/related_object_list_entity.dart';

relatedObjectListEntityFromJson(RelatedObjectListEntity data, Map<String, dynamic> json) {
	if (json['success'] != null) {
		data.success = json['success']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['data'] != null) {
		data.data = new List<RelatedObjectListData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new RelatedObjectListData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> relatedObjectListEntityToJson(RelatedObjectListEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

relatedObjectListDataFromJson(RelatedObjectListData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['realname'] != null) {
		data.realname = json['realname']?.toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile']?.toString();
	}
	if (json['card_no'] != null) {
		data.cardNo = json['card_no']?.toString();
	}
	if (json['sex'] != null) {
		data.sex = json['sex']?.toInt();
	}
	if (json['birthday'] != null) {
		data.birthday = json['birthday']?.toString();
	}
	if (json['area_id'] != null) {
		data.areaId = json['area_id']?.toInt();
	}
	if (json['city_id'] != null) {
		data.cityId = json['city_id']?.toInt();
	}
	if (json['area_name'] != null) {
		data.areaName = json['area_name']?.toString();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['disease'] != null) {
		data.disease = json['disease']?.toString();
	}
	if (json['allergy'] != null) {
		data.allergy = json['allergy']?.toString();
	}
	if (json['relation'] != null) {
		data.relation = json['relation']?.toString();
	}
	if (json['avatar'] != null) {
		data.avatar = json['avatar']?.toString();
	}
	return data;
}

Map<String, dynamic> relatedObjectListDataToJson(RelatedObjectListData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['realname'] = entity.realname;
	data['mobile'] = entity.mobile;
	data['card_no'] = entity.cardNo;
	data['sex'] = entity.sex;
	data['birthday'] = entity.birthday;
	data['area_id'] = entity.areaId;
	data['city_id'] = entity.cityId;
	data['area_name'] = entity.areaName;
	data['address'] = entity.address;
	data['disease'] = entity.disease;
	data['allergy'] = entity.allergy;
	data['relation'] = entity.relation;
	data['avatar'] = entity.avatar;
	return data;
}