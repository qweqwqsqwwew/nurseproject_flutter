class UserModel{
  String nickname;
  String mobile;
  String realname;
  String avatar;
  String username;
  String uid;
  String token;
  UserModel.fromMap(Map<String, dynamic> json) {
    this.nickname = json["nickname"];
    this.mobile = json["mobile"];
    this.realname = json["realname"];
    this.avatar = json["avatar"];
    this.username = json["username"];
    this.uid = json["uid"];
    this.token = json["token"];
  }
}