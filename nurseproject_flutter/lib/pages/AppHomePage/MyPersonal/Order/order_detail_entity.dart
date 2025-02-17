import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import 'package:nurseproject_flutter/generated/json/base/json_field.dart';

class OrderDetailEntity with JsonConvert<OrderDetailEntity> {
	@JSONField(name: "order_id")
	int orderId;
	@JSONField(name: "person_id")
	int personId;
	@JSONField(name: "person_name")
	String personName;
	@JSONField(name: "hospital_id")
	int hospitalId;
	@JSONField(name: "hospital_name")
	String hospitalName;
	@JSONField(name: "nurse_id")
	int nurseId;
	@JSONField(name: "nurse_name")
	String nurseName;
	@JSONField(name: "care_level")
	int careLevel;
	@JSONField(name: "item_id")
	int itemId;
	@JSONField(name: "version_id")
	int versionId;
	@JSONField(name: "item_name")
	String itemName;
	@JSONField(name: "item_num")
	int itemNum;
	@JSONField(name: "area_name")
	String areaName;
	String address;
	String disease;
	String allergy;
	@JSONField(name: "service_at")
	String serviceAt;
	@JSONField(name: "has_advice")
	int hasAdvice;
	@JSONField(name: "has_drug")
	int hasDrug;
	@JSONField(name: "has_device")
	int hasDevice;
	String desc;
	String attach;
	int status;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "status_text")
	String statusText;
	@JSONField(name: "care_level_text")
	String careLevelText;
	@JSONField(name: "origin_price")
	double originPrice;
	double price;
	@JSONField(name: "item_fee")
	double itemFee;
	@JSONField(name: "home_fee")
	double homeFee;
	@JSONField(name: "traffic_fee")
	double trafficFee;
	@JSONField(name: "material_fee")
	int materialFee;
	@JSONField(name: "discount_fee")
	int discountFee;
	@JSONField(name: "payed_amount")
	int payedAmount;
	@JSONField(name: "item_sn")
	String itemSn;
	String logo;
	String intro;
	@JSONField(name: "hospital_star")
	int hospitalStar;
	@JSONField(name: "nurse_star")
	int nurseStar;
	@JSONField(name: "caregiver_name")
	String caregiverName;
	@JSONField(name: "caregiver_mobile")
	String caregiverMobile;
	String trade_number;
}
