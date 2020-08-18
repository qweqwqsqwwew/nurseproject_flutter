class ServiceCateItem {
  String id;
  String title;
  String link;
  String banner;
  ServiceCateItem.fromMap(Map<String,dynamic> json){
    this.id = json["id"].toString();
    this.title = json["title"].toString();
    this.link = json["link"].toString();
    this.banner = json["banner"].toString();
  }
}