
class BannerItem {
  int id;
  String title;
  String link;
  String desc;
  String type;
  String img;

  BannerItem.fromMap(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.link = json["link"];
    this.desc = json["desc"];
    this.type = json["desc"];
    this.img = json["img"];
  }


  @override
  String toString(){
    return 'BannerItem{title:$title,link:$link,desc:$desc,type:$type,img:$img}';
  }
}

class HomeItem {
  String item_id;
  String price;
  String sale_num;
  String sn;
  String intro;
  String logo;
  String name;
  String banner;
  String cate_id;
  String is_hot;
  String is_set;
  String cate_name;
  String view_url;

  HomeItem.fromMap(Map<String,dynamic> json){
    this.item_id = json["item_id"].toString();
    this.price = json["price"].toString();
    this.sale_num = json["sale_num"].toString();
    this.sn = json["sn"].toString();
    this.intro = json["intro"];
    this.name = json["name"];
    this.logo = json["logo"];
    this.banner = json["banner"];
    this.cate_id = json["cate_id"].toString();
    this.is_hot = json["is_hot"].toString();
    this.is_set = json["is_set"].toString();
    this.cate_name = json["cate_name"];
    this.view_url = json["view_url"];
  }
//  @override
//  String toString() {
//    // TODO: implement toString
//    return 'HomeItem{sn:$sn,intro:$intro,logo:$logo,banner:$banner,cate_name:$cate_name,view_url:$view_url,name:$name}';
//  }

}

