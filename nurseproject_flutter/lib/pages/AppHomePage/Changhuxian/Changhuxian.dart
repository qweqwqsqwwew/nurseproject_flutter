import '../../../utils/util.dart';
import 'package:flutter/material.dart';


class Changhuxian extends StatefulWidget {
  Changhuxian({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Changhuxian> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
    return Scaffold(
      appBar: AppBar(
        title: Text('长互险'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.height(30)),
                  alignment: Alignment.centerLeft,
                  child: Text('说明文字',style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(40)),),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenAdaper.height(30),left: ScreenAdaper.width(30),right: ScreenAdaper.width(30)),
                  child: Text('本单位对提供的材料进行了认真审核，保证所填写的信息和提供的资料真实有效，无任何虚假申报情况，若因本单位未履行审查职责造成申报材料虚假的，本单位愿意接受行政处罚，并承担由此带来的法律后果。',style:TextStyle(fontSize: ScreenAdaper.sp(30)),),
                ),
                Container(
                  margin: EdgeInsets.only(top: ScreenAdaper.height(600)),
                  child: new ClipRRect(
                    borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
                    child: Container(
                        width: ScreenAdaper.screenWidth() - ScreenAdaper.width(100),
                        color: Colors.orange,
                        height: ScreenAdaper.height(80),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          child: Text('申请评估',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                          onTap: (){
                            var m = StorageUtil().getUserModel();
                            if(m!=null){
                              Navigator.pushNamed(
                                context,
                                '/orderEvaluate',    ///进预约页面
                                arguments: {}, //　传递参数
                              );
                            }else{
                              Navigator.pushNamed(
                                context,
                                '/login',
                                arguments: {}, //　传递参数
                              );
                            }
                          },
                        )
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }
}
