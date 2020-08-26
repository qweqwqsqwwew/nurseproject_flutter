import 'package:nurseproject_flutter/pages/AppHomePage/LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import './MyPersonal.dart';
import 'dart:async';
import 'package:flutter/services.dart';
//import 'package:flutter_plugin_qrcode/flutter_plugin_qrcode.dart';
import 'package:nurseproject_flutter/components/Qrcode/flutter_plugin_qrcode.dart';

class MineLogin extends StatelessWidget {
  final UserModel _userModelData;
  MineLogin(this._userModelData);
  String _qrcode = '二维码扫描';

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: List.generate(6, (index) {
        return _judegeLoginBackWidget(context, index);
      }),
    );
  }

  Widget _judegeLoginBackWidget(BuildContext context,int index){
    if (index == 0){
      return _topHeader(context);
    }else{
      List imageStrList = ["asset/images/mine/contactServicer.png","asset/images/mine/help.png","asset/images/mine/contactServicer.png","asset/images/mine/help.png","asset/images/mine/contactServicer.png"];
      List titleStrList = ["关联对象","个人设置","联系客服","用户帮助","用户协议和隐私政策"];
      return _buildListItem(context,imageStrList[index - 1], titleStrList[index - 1],index);
    }
  }

  Widget _buildListItem(BuildContext context,String imageStr,String title,int index){
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
        if (index == 3){
          LogUtil.d('------点击了');
          showAlertDialog(context);
        }else if(index == 4){
          Navigator.pushNamed(
            context,
            '/commmenWebview',
            arguments: {"url":"https://didi.depin.tech/view-article/9f23f37fa9ced4dacd5f3df418ab9cf1","title":"帮助"}, //　传递参数
          );
        }else if(index == 2){
          Navigator.pushNamed(
            context,
            '/personalSetting',
            arguments: {}, //　传递参数
          );
        }else if(index == 1){
          Navigator.pushNamed(
            context,
            '/relatedObject',
            arguments: _userModelData, //　传递参数
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

    Future<void> getQrcodeState() async {
      String qrcode;
      try {
        qrcode = await FlutterPluginQrcode.getQRCode;
      } on PlatformException {
        qrcode = 'Failed to get platform version.';
      }

//      if (!mounted) return;
      //获取到扫描的结果进行页面更新
//      setState(() {
        _qrcode = qrcode;
//      });
    }

  Widget _topHeader(BuildContext context){
    return Container(
      child: Column(
        children: [
          Container(
            width: ScreenAdaper.screenWidth(),
            height: ScreenAdaper.height(400),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFF8C40), Color(0xFFFFB347)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Image.asset("asset/images/mine/saomiao.png",width: ScreenAdaper.width(40),height: ScreenAdaper.height(40),),
                        ),
                        onTap: (){
                          LogUtil.d('----------dddd');
                          getQrcodeState();
                        },
                      ),
                      Container(
                        child: Text(_userModelData!=null?_userModelData.realname:'名字',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(40)),),
                      ),
                      Image.asset("asset/images/mine/erweima.png",width: ScreenAdaper.width(40),height: ScreenAdaper.height(40),),
                    ],
                  ),
                  margin: EdgeInsets.only(top: ScreenAdaper.height(100)),
                  padding: EdgeInsets.only(left: ScreenAdaper.width(30),right: ScreenAdaper.width(30)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                    child: ClipOval(
                        child: _userModelData.avatar.length == 0?
                        Image.asset("asset/images/mine/men.png",width: ScreenAdaper.height(130),height: ScreenAdaper.height(130),):
                        new FadeInImage.assetNetwork(
                          placeholder: "asset/images/mine/men.png",//预览图
                          fit: BoxFit.cover,
                          image:_userModelData.avatar,
                          width: ScreenAdaper.height(130),
                          height: ScreenAdaper.height(130),
                        ),
                    ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: ScreenAdaper.height(90),
            child: Container(
              margin:EdgeInsets.only(left: ScreenAdaper.width(30)),
              child: Text("我的订单",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(35)),),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(10),bottom: ScreenAdaper.height(20)),
            padding:EdgeInsets.only(left: ScreenAdaper.width(20),right: ScreenAdaper.width(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child:  GestureDetector(
                    child: Column(
                      children: [
                        Image.asset("asset/images/mine/Order_all.png",width: ScreenAdaper.width(40),height: ScreenAdaper.height(50),),
                        Container(
                            margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                            child: Text("全部",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),)
                        ),
                      ],
                    ),
                    onTap: (){
                      Navigator.pushNamed(
                        context,
                        '/order',
                        arguments: {}, //　传递参数
                      );
                    },
                  )
                ),
                Container(
                  child:  Column(
                    children: [
                      Image.asset("asset/images/mine/Order_Payment.png",width: ScreenAdaper.width(40),height: ScreenAdaper.height(50),),
                      Container(
                          margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                          child: Text("待付款",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),)
                      ),
                    ],
                  ),
                ),
                Container(
                  child:  Column(
                    children: [
                      Image.asset("asset/images/mine/Order_served.png",width: ScreenAdaper.width(40),height: ScreenAdaper.height(50),),
                      Container(
                          margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                          child: Text("待服务",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),)
                      ),
                    ],
                  ),
                ),
                Container(
                  child:  Column(
                    children: [
                      Image.asset("asset/images/mine/Order_evaluate.png",width: ScreenAdaper.width(40),height: ScreenAdaper.height(50),),
                      Container(
                          margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                          child: Text("待评价",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),)
                      ),
                    ],
                  ),
                ),
                Container(
                  child:  Column(
                    children: [
                      Image.asset("asset/images/mine/Order_complete.png",width: ScreenAdaper.width(40),height: ScreenAdaper.height(50),),
                      Container(
                          margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                          child: Text("已完成",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),)
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  _launchPhone() async {
    const url = 'tel:0512-66568030';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

