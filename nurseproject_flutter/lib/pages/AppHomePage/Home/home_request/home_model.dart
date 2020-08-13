
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

