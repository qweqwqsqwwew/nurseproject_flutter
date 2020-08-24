import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import 'package:nurseproject_flutter/utils/util.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:nurseproject_flutter/provider/appCommenNetData.dart';
import 'package:provider/provider.dart';
import './MineLogin.dart';
class Mine extends StatefulWidget {
  Mine({Key key, this.params}) : super(key: key);
  final params;
  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<Mine> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  dynamic _currentUserModel = null;

  GainUserModel _userModelProvider;
  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    LogUtil.d("------a---------------");
    _userModelProvider = Provider.of<GainUserModel>(context);
    if(_userModelProvider.getuserModel == null){
      _userModelProvider.setCurrenUserModel();
    }else{
      _currentUserModel = _userModelProvider.getuserModel;
    }
    return Scaffold(
      appBar: PreferredSize(
        child: Offstage(
          offstage: true,
          child: AppBar(
            title: Text('我的',style: TextStyle(color: Colors.white),),
          ),
        ),
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
      ),
      body:Consumer<GainUserModel>(
        builder: (_, a, child) =>
        _currentUserModel == 0?ListView(
          children: List.generate(3, (index) {
            return _judegeUnLoginBackWidget(context, index);
          }),
        ):MineLogin(_currentUserModel),
      )
    );
  }

   Widget _judegeUnLoginBackWidget(BuildContext context,int index){
    if (index == 0){
      return _setupPage(context);
    }else{
      List imageStrList = ["asset/images/mine/contactServicer.png","asset/images/mine/help.png"];
      List titleStrList = ["联系客服","帮助"];
      return _buildListItem(imageStrList[index - 1], titleStrList[index - 1]);
    }
  }

  Widget _setupPage(BuildContext context){
    return Container(
      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: ScreenAdaper.screenWidth(),
            height: ScreenAdaper.height(500),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8C40), Color(0xFFFFB347)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Text('未登录',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35)),textAlign: TextAlign.center,),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Image.asset("asset/images/mine/men.png",width: ScreenAdaper.width(130),height: ScreenAdaper.height(130),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                         new ClipRRect(
                           borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
                           child: Container(
    //                          margin: EdgeInsets.only(left: 20),
                                  width: ScreenAdaper.width(190),
                                  height: ScreenAdaper.height(70),
                                  alignment: Alignment.center,
                                  color: Colors.orange,
                                  child: GestureDetector(
                                    child: Text('登陆',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                                    onTap: (){
                                      Navigator.pushNamed(
                                        context,
                                        '/login',
                                        arguments: {}, //　传递参数
                                      );
                                    },
                                  )
                              ),
                           ),
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
                          child: Container(
//                            margin: EdgeInsets.only(left: 40),
                            width: ScreenAdaper.width(190),
                            color: Colors.orange,
                            height: ScreenAdaper.height(70),
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Text('注册',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                              onTap: (){
                                Navigator.pushNamed(
                                  context,
                                  '/registerv',
                                  arguments: {}, //　传递参数
                                );
                              },
                            )
                          ),
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildListItem(String imageStr,String title){
    return GestureDetector(
      child: Container(
        color: Colors.white,
        height: ScreenAdaper.height(100),
        width: ScreenAdaper.screenWidth(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    //asset/images/mine/men.png
                    child: Image.asset(imageStr,width: ScreenAdaper.width(40),height: ScreenAdaper.height(40),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(title,style: TextStyle(color: Colors.black,fontSize: ScreenAdaper.sp(30)),),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Image.asset("asset/images/mine/jiantou.png",width: ScreenAdaper.width(25),height: ScreenAdaper.height(35),),
            )
          ],
        ),
      ),
      onTap: (){
        if (title== "联系客服"){
          LogUtil.d('------点击了');
          showAlertDialog(context);
        }else if(title== "帮助"){
          Navigator.pushNamed(
            context,
            '/commmenWebview',
            arguments: {"url":"https://didi.depin.tech/view-article/9f23f37fa9ced4dacd5f3df418ab9cf1","title":"帮助"}, //　传递参数
          );
        }
      },
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('拨打电话：0512-66568030'),
            title: Center(
                child: Text(
                  '联系客服',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchPhone();
                  },
                  child: Text('确定')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消')),
            ],
          );
        });
  }
}


_launchPhone() async {
  const url = 'tel:0512-66568030';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}