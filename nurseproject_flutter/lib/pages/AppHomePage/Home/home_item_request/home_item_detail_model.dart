
import 'package:flutter/material.dart';

class ItemDetail{

  String id;
  String name;
  String sn;
  String logo;
  String banner;
  String price;
  String times;
  String cate_id;
  String is_hot;
  String is_set;
  String intro;
  String crowd;
  String note;
  String content;
  String material;
  String cate_name;
  List price_set;
  List<StepItem> steps;

  ItemDetail.fromMap(Map<String,dynamic> json){
    this.id = json["id"].toString();
    this.name = json["name"].toString();
    this.sn = json["sn"].toString();
    this.logo = json["logo"].toString();
    this.banner = json["banner"].toString();
    this.price = json["price"].toString();
    this.times = json["times"].toString();
    this.cate_id = json["cate_id"].toString();
    this.is_hot = json["is_hot"].toString();
    this.is_set = json["is_set"].toString();
    this.intro = json["intro"].toString();
    this.crowd = json["crowd"].toString();
    this.note = json["note"].toString();
    this.content = json["content"].toString();
    this.material = json["material"].toString();
    this.cate_name = json["cate_name"].toString();
    this.price_set = json["price_set"] as List;
    this.steps = (json["steps"] as List<dynamic>).map((item){
      return StepItem.fromMap(item);
    }).toList();
  }

}

class StepItem{
  String step;
  List<StepItemItem> items;

  StepItem.fromMap(Map<String,dynamic> json){
    this.step = json["step"].toString();
    this.items = (json["items"] as List<dynamic>).map((item){
      return StepItemItem.fromMap(item);
    }).toList();
  }


}

class StepItemItem{
  String id;
  String name;

  StepItemItem.fromMap(Map<String,dynamic> json){
    this.id = json["id"].toString();
    this.name = json["name"].toString();
  }
}