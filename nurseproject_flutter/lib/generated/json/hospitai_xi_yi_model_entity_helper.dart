import 'package:nurseproject_flutter/pages/AppHomePage/Home/ServiceObject/hospitai_xi_yi_model_entity.dart';

hospitaiXiYiModelEntityFromJson(HospitaiXiYiModelEntity data, Map<String, dynamic> json) {
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

Map<String, dynamic> hospitaiXiYiModelEntityToJson(HospitaiXiYiModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['sn'] = entity.sn;
	data['title'] = entity.title;
	data['url'] = entity.url;
	return data;
}