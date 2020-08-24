import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/utils/screen_adaper.dart';
import './RelatedObjectItemModel.dart';
import './DottedLineWidget.dart';
class RelatedObjectItem extends StatelessWidget {
  final RelatedObjectItemModel _model;
  RelatedObjectItem(this._model);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.only(left: ScreenAdaper.width(30)),
        child: Row(
          children: [
            ClipOval(
                child: _model.avatar.length == 0?Image.asset("asset/images/mine/men.png",width: ScreenAdaper.width(90),height: ScreenAdaper.height(90),):Image.network(_model.avatar,width: ScreenAdaper.width(90),height: ScreenAdaper.height(90),)
            ),
            Container(
              margin: EdgeInsets.only(left: ScreenAdaper.width(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        child: Text('姓   名：${_model.realname}'),
                        margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: ScreenAdaper.width(40)),
                        child: Text('年   龄：${_model.birthday}'),
                      ),
                    ],
                  ),
                  Container(
                    child: Text('身份证号：${_model.card_no}'),
                  ),
                  Container(
                    child: Text('关   系：${_model.relation}'),
                  ),
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
