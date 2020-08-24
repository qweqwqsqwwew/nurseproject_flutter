import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import 'package:nurseproject_flutter/provider/appCommenNetData.dart';
import 'package:provider/provider.dart';
class PersonalSetting extends StatefulWidget {
  PersonalSetting({Key key, this.params}) : super(key: key);
  final params;
  @override
  _PersonalSettingState createState() => _PersonalSettingState();
}

class _PersonalSettingState extends State<PersonalSetting> {

  GainUserModel _userModelProvider;

  @override
  Widget build(BuildContext context) {
    _userModelProvider = Provider.of<GainUserModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('个人设置'),
      ),
      body: Container(
        color: Colors.white,
        child: Container(
          margin: EdgeInsets.only(top: ScreenAdaper.height(600)),
          child: new ClipRRect(
            borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
            child: Container(
                width: ScreenAdaper.screenWidth() - ScreenAdaper.width(100),
                color: Colors.orange,
                height: ScreenAdaper.height(80),
                alignment: Alignment.center,
                child: GestureDetector(
                  child: Text('退出登录',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                  onTap: (){
                    LogUtil.d('----------fff----');
                    StorageUtil().removeLogin().then((value){
                      _userModelProvider.setCurrenUserModel();
                      Navigator.pop(context);
                    });
                  },
                )
            ),
          ),
        ),
      ),
    );
  }
}
