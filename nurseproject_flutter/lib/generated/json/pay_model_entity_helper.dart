import 'package:nurseproject_flutter/pages/AppHomePage/MyPersonal/Order/pay_model_entity.dart';

payModelEntityFromJson(PayModelEntity data, Map<String, dynamic> json) {
	if (json['parameters'] != null) {
		data.parameters = json['parameters']?.toString();
	}
	return data;
}

Map<String, dynamic> payModelEntityToJson(PayModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['parameters'] = entity.parameters;
	return data;
}