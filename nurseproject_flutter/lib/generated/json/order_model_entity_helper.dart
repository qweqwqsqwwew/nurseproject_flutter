import 'package:nurseproject_flutter/pages/AppHomePage/MyPersonal/Order/order_model_entity.dart';

orderModelEntityFromJson(OrderModelEntity data, Map<String, dynamic> json) {
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
		data.xList = new List<OrderModelList>();
		(json['list'] as List).forEach((v) {
			data.xList.add(new OrderModelList().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> orderModelEntityToJson(OrderModelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['page'] = entity.page;
	data['next'] = entity.next;
	if (entity.xList != null) {
		data['list'] =  entity.xList.map((v) => v.toJson()).toList();
	}
	return data;
}

orderModelListFromJson(OrderModelList data, Map<String, dynamic> json) {
	if (json['order_id'] != null) {
		data.orderId = json['order_id']?.toInt();
	}
	if (json['trade_no'] != null) {
		data.tradeNo = json['trade_no']?.toString();
	}
	if (json['item_id'] != null) {
		data.itemId = json['item_id']?.toInt();
	}
	if (json['item_sn'] != null) {
		data.itemSn = json['item_sn']?.toString();
	}
	if (json['item_name'] != null) {
		data.itemName = json['item_name']?.toString();
	}
	if (json['item_num'] != null) {
		data.itemNum = json['item_num']?.toInt();
	}
	if (json['price'] != null) {
		data.price = json['price']?.toDouble();
	}
	if (json['intro'] != null) {
		data.intro = json['intro']?.toString();
	}
	if (json['logo'] != null) {
		data.logo = json['logo']?.toString();
	}
	if (json['person_id'] != null) {
		data.personId = json['person_id']?.toInt();
	}
	if (json['person_name'] != null) {
		data.personName = json['person_name']?.toString();
	}
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['created_at'] != null) {
		data.createdAt = json['created_at']?.toString();
	}
	if (json['refund_status'] != null) {
		data.refundStatus = json['refund_status']?.toInt();
	}
	if (json['refund_amount'] != null) {
		data.refundAmount = json['refund_amount']?.toString();
	}
	if (json['apply_amount'] != null) {
		data.applyAmount = json['apply_amount']?.toString();
	}
	if (json['status_text'] != null) {
		data.statusText = json['status_text']?.toString();
	}
	if (json['to_pay'] != null) {
		data.toPay = json['to_pay'];
	}
	if (json['to_comment'] != null) {
		data.toComment = json['to_comment'];
	}
	if (json['to_complain'] != null) {
		data.toComplain = json['to_complain'];
	}
	return data;
}

Map<String, dynamic> orderModelListToJson(OrderModelList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['order_id'] = entity.orderId;
	data['trade_no'] = entity.tradeNo;
	data['item_id'] = entity.itemId;
	data['item_sn'] = entity.itemSn;
	data['item_name'] = entity.itemName;
	data['item_num'] = entity.itemNum;
	data['price'] = entity.price;
	data['intro'] = entity.intro;
	data['logo'] = entity.logo;
	data['person_id'] = entity.personId;
	data['person_name'] = entity.personName;
	data['status'] = entity.status;
	data['created_at'] = entity.createdAt;
	data['refund_status'] = entity.refundStatus;
	data['refund_amount'] = entity.refundAmount;
	data['apply_amount'] = entity.applyAmount;
	data['status_text'] = entity.statusText;
	data['to_pay'] = entity.toPay;
	data['to_comment'] = entity.toComment;
	data['to_complain'] = entity.toComplain;
	return data;
}