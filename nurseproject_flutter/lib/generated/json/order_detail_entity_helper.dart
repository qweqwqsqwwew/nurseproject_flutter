import 'package:nurseproject_flutter/pages/AppHomePage/MyPersonal/Order/order_detail_entity.dart';

orderDetailEntityFromJson(OrderDetailEntity data, Map<String, dynamic> json) {
	if (json['order_id'] != null) {
		data.orderId = json['order_id']?.toInt();
	}
	if (json['person_id'] != null) {
		data.personId = json['person_id']?.toInt();
	}
	if (json['person_name'] != null) {
		data.personName = json['person_name']?.toString();
	}
	if (json['hospital_id'] != null) {
		data.hospitalId = json['hospital_id']?.toInt();
	}
	if (json['hospital_name'] != null) {
		data.hospitalName = json['hospital_name']?.toString();
	}
	if (json['nurse_id'] != null) {
		data.nurseId = json['nurse_id']?.toInt();
	}
	if (json['nurse_name'] != null) {
		data.nurseName = json['nurse_name']?.toString();
	}
	if (json['care_level'] != null) {
		data.careLevel = json['care_level']?.toInt();
	}
	if (json['item_id'] != null) {
		data.itemId = json['item_id']?.toInt();
	}
	if (json['version_id'] != null) {
		data.versionId = json['version_id']?.toInt();
	}
	if (json['item_name'] != null) {
		data.itemName = json['item_name']?.toString();
	}
	if (json['item_num'] != null) {
		data.itemNum = json['item_num']?.toInt();
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
	if (json['service_at'] != null) {
		data.serviceAt = json['service_at']?.toString();
	}
	if (json['has_advice'] != null) {
		data.hasAdvice = json['has_advice']?.toInt();
	}
	if (json['has_drug'] != null) {
		data.hasDrug = json['has_drug']?.toInt();
	}
	if (json['has_device'] != null) {
		data.hasDevice = json['has_device']?.toInt();
	}
	if (json['desc'] != null) {
		data.desc = json['desc']?.toString();
	}
	if (json['attach'] != null) {
		data.attach = json['attach']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['status_text'] != null) {
		data.statusText = json['status_text']?.toString();
	}
	if (json['care_level_text'] != null) {
		data.careLevelText = json['care_level_text']?.toString();
	}
	if (json['origin_price'] != null) {
		data.originPrice = json['origin_price']?.toDouble();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['item_fee'] != null) {
		data.itemFee = json['item_fee']?.toDouble();
	}
	if (json['home_fee'] != null) {
		data.homeFee = json['home_fee']?.toDouble();
	}
	if (json['traffic_fee'] != null) {
		data.trafficFee = json['traffic_fee']?.toDouble();
	}
	if (json['material_fee'] != null) {
		data.materialFee = json['material_fee']?.toInt();
	}
	if (json['discount_fee'] != null) {
		data.discountFee = json['discount_fee']?.toInt();
	}
	if (json['payed_amount'] != null) {
		data.payedAmount = json['payed_amount']?.toInt();
	}
	if (json['item_sn'] != null) {
		data.itemSn = json['item_sn']?.toString();
	}
	if (json['logo'] != null) {
		data.logo = json['logo']?.toString();
	}
	if (json['intro'] != null) {
		data.intro = json['intro']?.toString();
	}
	if (json['hospital_star'] != null) {
		data.hospitalStar = json['hospital_star']?.toInt();
	}
	if (json['nurse_star'] != null) {
		data.nurseStar = json['nurse_star']?.toInt();
	}
	if (json['caregiver_name'] != null) {
		data.caregiverName = json['caregiver_name']?.toString();
	}
	if (json['caregiver_mobile'] != null) {
		data.caregiverMobile = json['caregiver_mobile']?.toString();
	}
	if (json['trade_number'] != null) {
		data.trade_number = json['trade_number']?.toString();
	}
	return data;
}

Map<String, dynamic> orderDetailEntityToJson(OrderDetailEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['order_id'] = entity.orderId;
	data['person_id'] = entity.personId;
	data['person_name'] = entity.personName;
	data['hospital_id'] = entity.hospitalId;
	data['hospital_name'] = entity.hospitalName;
	data['nurse_id'] = entity.nurseId;
	data['nurse_name'] = entity.nurseName;
	data['care_level'] = entity.careLevel;
	data['item_id'] = entity.itemId;
	data['version_id'] = entity.versionId;
	data['item_name'] = entity.itemName;
	data['item_num'] = entity.itemNum;
	data['area_name'] = entity.areaName;
	data['address'] = entity.address;
	data['disease'] = entity.disease;
	data['allergy'] = entity.allergy;
	data['service_at'] = entity.serviceAt;
	data['has_advice'] = entity.hasAdvice;
	data['has_drug'] = entity.hasDrug;
	data['has_device'] = entity.hasDevice;
	data['desc'] = entity.desc;
	data['attach'] = entity.attach;
	data['status'] = entity.status;
	data['created_at'] = entity.createdAt;
	data['status_text'] = entity.statusText;
	data['care_level_text'] = entity.careLevelText;
	data['origin_price'] = entity.originPrice;
	data['price'] = entity.price;
	data['item_fee'] = entity.itemFee;
	data['home_fee'] = entity.homeFee;
	data['traffic_fee'] = entity.trafficFee;
	data['material_fee'] = entity.materialFee;
	data['discount_fee'] = entity.discountFee;
	data['payed_amount'] = entity.payedAmount;
	data['item_sn'] = entity.itemSn;
	data['logo'] = entity.logo;
	data['intro'] = entity.intro;
	data['hospital_star'] = entity.hospitalStar;
	data['nurse_star'] = entity.nurseStar;
	data['caregiver_name'] = entity.caregiverName;
	data['caregiver_mobile'] = entity.caregiverMobile;
	data['trade_number'] = entity.trade_number;
	return data;
}