import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import 'package:nurseproject_flutter/generated/json/base/json_field.dart';

class HospitalModelEntity with JsonConvert<HospitalModelEntity> {
	int total;
	int page;
	bool next;
	@JSONField(name: "list")
	List<HospitalModelList> xList;
}

class HospitalModelList with JsonConvert<HospitalModelList> {
	int id;
	String name;
	String level;
	String logo;
	String banner;
	@JSONField(name: "charge_type")
	int chargeType;
	@JSONField(name: "charge_qrcode")
	String chargeQrcode;
	String address;
	int seq;
}
