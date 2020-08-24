
class RelatedObjectItemModel{
  String avatar;
  String area_name;
  String mobile;
  String relation;
  String realname;
  String city_id;
  String sex;
  String birthday;
  String id;
  String allergy;
  String address;
  String card_no;
  String disease;
  String area_id;

  RelatedObjectItemModel.fromMap(Map<String,dynamic> json){
    this.avatar = json["avatar"].toString();
    this.area_name = json["area_name"].toString();
    this.mobile = json["mobile"].toString();
    this.relation = json["relation"].toString();
    this.realname = json["realname"].toString();
    this.city_id = json["city_id"].toString();
    this.sex = json["sex"].toString();
    this.birthday = json["birthday"].toString();
    this.id = json["id"].toString();
    this.allergy = json["allergy"].toString();
    this.card_no = json["card_no"].toString();
    this.disease = json["disease"].toString();
    this.area_id = json["area_id"].toString();

  }

}