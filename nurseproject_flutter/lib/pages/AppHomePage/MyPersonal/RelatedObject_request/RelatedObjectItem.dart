import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/utils/screen_adaper.dart';
import './DottedLineWidget.dart';
import 'related_object_list_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
class RelatedObjectItem extends StatelessWidget {
  RelatedObjectListData _model;
  RelatedObjectItem(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: ScreenAdaper.width(30),top: ScreenAdaper.width(13)),
        child: Row(
          children: [
            ClipOval(
                child: _model.avatar.length == 0?Image.asset("asset/images/mine/men.png",width: ScreenAdaper.height(100),height: ScreenAdaper.height(100),):CachedNetworkImage(imageUrl:_model.avatar,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.height(100),height: ScreenAdaper.height(100),)
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenAdaper.width(40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text('姓   名：${_model.realname}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                        margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenAdaper.width(90)),
                        child: Text('出生日期：${_model.birthday}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                      ),
                    ],
                  ),
                  Container(
                    child: Text('身份证号：${_model.cardNo}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                  ),
                  Container(
                    child: Text('关   系：${_model.relation}',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25)),),
                  ),
                  SizedBox(height: ScreenAdaper.height(13),),
                  Container(
                    alignment: Alignment.center,
                    child: DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,), // 水平方向,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
