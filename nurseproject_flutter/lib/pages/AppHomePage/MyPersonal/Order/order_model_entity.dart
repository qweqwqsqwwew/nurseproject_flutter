import 'package:nurseproject_flutter/generated/json/base/json_convert_content.dart';
import 'package:nurseproject_flutter/generated/json/base/json_field.dart';

class OrderModelEntity with JsonConvert<OrderModelEntity> {
	int total;
	int page;
	bool next;
	@JSONField(name: "list")
	List<OrderModelList> xList;
}

class OrderModelList with JsonConvert<OrderModelList> {
	@JSONField(name: "order_id")
	int orderId;
	@JSONField(name: "trade_no")
	String tradeNo;
	@JSONField(name: "item_id")
	int itemId;
	@JSONField(name: "item_sn")
	String itemSn;
	@JSONField(name: "item_name")
	String itemName;
	@JSONField(name: "item_num")
	int itemNum;
	double price;
	String intro;
	String logo;
	@JSONField(name: "person_id")
	int personId;
	@JSONField(name: "person_name")
	String personName;
	int status;
	@JSONField(name: "created_at")
	String createdAt;
	@JSONField(name: "refund_status")
	int refundStatus;
	@JSONField(name: "refund_amount")
	String refundAmount;
	@JSONField(name: "apply_amount")
	String applyAmount;
	@JSONField(name: "status_text")
	String statusText;
	@JSONField(name: "to_pay")
	bool toPay;
	@JSONField(name: "to_comment")
	bool toComment;
	@JSONField(name: "to_complain")
	bool toComplain;
}
