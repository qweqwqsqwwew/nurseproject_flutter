import 'package:nurseproject_flutter/pages/AppHomePage/MyPersonal/MineRequest/zong_xi_yi_model_entity.dart';

zongXiYiModelEntityFromJson(ZongXiYiModelEntity data, Map<String, dynamic> json) {
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
		data.data = new List<ZongXiYiModelData>();
		(json['data'] as List).forEach((v) {
			data.data.add(new ZongXiYiModelData().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> zongXiYiModelEntityToJson(ZongXiYiModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['success'] = entity.success;
	data['msg'] = entity.msg;
	data['code'] = entity.code;
	if (entity.data != null) {
		data['data'] =  entity.data.map((v) => v.toJson()).toList();
	}
	return data;
}

zongXiYiModelDataFromJson(ZongXiYiModelData data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['sn'] != null) {
		data.sn = json['sn']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['url'] != null) {
		data.url = json['url']?.toString();
	}
	return data;
}

Map<String, dynamic> zongXiYiModelDataToJson(ZongXiYiModelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['sn'] = entity.sn;
	data['title'] = entity.title;
	data['url'] = entity.url;
	return data;
}