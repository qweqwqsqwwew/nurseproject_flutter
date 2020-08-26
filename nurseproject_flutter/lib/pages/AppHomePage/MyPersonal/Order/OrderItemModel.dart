class OrderItemModel{
//  "order_id": 104764,
//  "trade_no": "2020081147772570104974",
//  "item_id": 10052,
//  "item_sn": "6d019058637dcd05c7d7b7c0d6039209",
//  "item_name": "上门基础护理套餐",
//  "item_num": 1,
//  "price": 0.04,
//  "intro": "生活环境清洁，进行生活护理，心理慰籍",
//  "logo": "https://didi.depin.tech/storage/service/2020/02/27/5e57506fb415d.png",
//  "person_id": 1001157,
//  "person_name": "陈道明",
//  "status": 1,
//  "created_at": "2020-08-11 10:22:50",
//  "refund_status": null,
//  "refund_amount": null,
//  "apply_amount": null,
//  "status_text": "未付款",
//  "to_pay": true,
//  "to_comment": false,
//  "to_complain": false
  String order_id;
  String trade_no;
  String item_id;
  String item_sn;
  String item_name;
  String item_num;
  String price;
  String intro;
  String logo;
  String person_id;
  String person_name;
  String status;
  String created_at;
  String refund_status;
  String refund_amount;
  String apply_amount;
  String status_text;
  String to_pay;
  String to_comment;
  String to_complain;

  OrderItemModel.fromMap(Map<String,dynamic> json){
    this.order_id = json["order_id"].toString();
    this.trade_no = json["trade_no"].toString();
    this.item_id = json["item_id"].toString();
    this.item_sn = json["item_sn"].toString();
    this.item_name = json["item_name"].toString();
    this.item_num = json["item_num"].toString();
    this.price = json["price"].toString();
    this.intro = json["intro"].toString();
    this.logo = json["logo"].toString();
    this.person_id = json["person_id"].toString();
    this.person_name = json["person_name"].toString();
    this.status = json["status"].toString();
    this.created_at = json["created_at"].toString();
    this.refund_status = json["refund_status"].toString();
    this.refund_amount = json["refund_amount"].toString();
    this.apply_amount = json["apply_amount"].toString();
    this.status_text = json["status_text"].toString();
    this.to_pay = json["to_pay"].toString();
    this.to_comment = json["to_comment"].toString();
    this.to_complain = json["to_complain"].toString();
  }


}