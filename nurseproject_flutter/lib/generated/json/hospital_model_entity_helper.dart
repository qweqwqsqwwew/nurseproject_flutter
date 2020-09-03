import 'package:nurseproject_flutter/pages/AppHomePage/Home/ServiceObject/hospital_model_entity.dart';

hospitalModelEntityFromJson(HospitalModelEntity data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total']?.toInt();
	}
	if (json['page'] != null) {
		data.page = json['page']?.toInt();
	}
	if (json['next'] != null) {
		data.next = json['next'];
	}
	if (json['list'] != null) {
		data.xList = new List<HospitalModelList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new HospitalModelList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> hospitalModelEntityToJson(HospitalModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['page'] = entity.page;
	data['next'] = entity.next;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

hospitalModelListFromJson(HospitalModelList data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id']?.toInt();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	if (json['level'] != null) {
		data.level = json['level']?.toString();
	}
	if (json['logo'] != null) {
		data.logo = json['logo']?.toString();
	}
	if (json['banner'] != null) {
		data.banner = json['banner']?.toString();
	}
	if (json['charge_type'] != null) {
		data.chargeType = json['charge_type']?.toInt();
	}
	if (json['charge_qrcode'] != null) {
		data.chargeQrcode = json['charge_qrcode']?.toString();
	}
	if (json['address'] != null) {
		data.address = json['address']?.toString();
	}
	if (json['seq'] != null) {
		data.seq = json['seq']?.toInt();
	}
	return data;
}

Map<String, dynamic> hospitalModelListToJson(HospitalModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['level'] = entity.level;
	data['logo'] = entity.logo;
	data['banner'] = entity.banner;
	data['charge_type'] = entity.chargeType;
	data['charge_qrcode'] = entity.chargeQrcode;
	data['address'] = entity.address;
	data['seq'] = entity.seq;
	return data;
}