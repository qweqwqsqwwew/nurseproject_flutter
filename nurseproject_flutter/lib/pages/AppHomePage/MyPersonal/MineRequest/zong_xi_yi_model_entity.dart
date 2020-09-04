import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';

class ZongXiYiModelEntity with JsonConvert<ZongXiYiModelEntity> {
	int success;
	String msg;
	int code;
	List<ZongXiYiModelData> data;
}

class ZongXiYiModelData with JsonConvert<ZongXiYiModelData> {
	int id;
	String sn;
	String title;
	String url;
}
