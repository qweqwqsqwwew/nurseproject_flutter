import 'package:flutter/material.dart';
import 'related_object_list_entity.dart';
import '../../../../utils/util.dart';
import 'DottedLineWidget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class RelatedObjectItemDetail extends StatefulWidget {
  RelatedObjectItemDetail({Key key, this.params}) : super(key: key);
  final RelatedObjectListData  params;
  @override
  _RelatedObjectItemDetailState createState() => _RelatedObjectItemDetailState();
}

class _RelatedObjectItemDetailState extends State<RelatedObjectItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关联对象'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (ctx, index) {
              return _buildPageWidget();
            })
      ),
    );
  }

  Widget _buildPageWidget(){
    return Container(
      margin: EdgeInsets.only(top: ScreenAdaper.height(10),bottom: 1),
      padding: EdgeInsets.only(top: ScreenAdaper.height(10),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
      child:Container(
          padding: EdgeInsets.only(top: ScreenAdaper.height(20),left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),bottom: ScreenAdaper.height(10)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 3.0), //阴影xy轴偏移量
                    blurRadius: 3.0, //阴影模糊程度
                    spreadRadius: 1.0 //阴影扩散程度
                )
              ]),
          child: Column(
            children: [

              Row(
                children: [
                ClipOval(
                        child:widget.params.avatar.length == 0?Image.asset("asset/images/mine/men.png",width: ScreenAdaper.height(100),height: ScreenAdaper.height(100),):CachedNetworkImage(imageUrl:widget.params.avatar,errorWidget: (context, url, error) => Icon(Icons.error),width: ScreenAdaper.height(100),height: ScreenAdaper.height(100),),
                ),
                Column(
                      children: [
                        Row(
                          children: [
                            Text("姓名：${widget.params.realname}"),
                            Text("性别：${widget.params.sex==0?'女':'男'}"),
                          ],
                        ),
                        DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,),
                        Row(
                          children: [
                            Text("关系：${widget.params.relation}"),
                            Text("出生日期：${widget.params.birthday}"),
                          ],
                        ),
                        DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,),
                      ],
                    ),
                ],
              ),
              Row(
                children: [
                  Text('身份证号:'),
                  Text('${widget.params.cardNo}'),
                ],
              ),
              DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,),
              Row(
                children: [
                  Text('出身日期:'),
                  Text('${widget.params.birthday}'),
                ],
              ),
              DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,),
              Row(
                children: [
                  Text('联系电话:'),
                  Text('${widget.params.mobile}'),
                ],
              ),
              DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,),
              Row(
                children: [
                  Text('详细地址:'),
                  Text('${widget.params.address}'),
                ],
              ),
              DottedLineWidget(axis: Axis.horizontal,width: ScreenAdaper.screenWidth() - ScreenAdaper.width(180),height: 10.0, lineHeight: 0.5,lineWidth: 3,count: 30,color: Colors.black45,),

            ],
          ),
        ),
    );

  }

}
