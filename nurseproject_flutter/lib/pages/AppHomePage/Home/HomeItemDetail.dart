import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/ioc/locator.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_item_request/home_item_request.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_item_request/home_item_detail_model.dart';
class HomeItemDetail extends StatefulWidget {
  HomeItemDetail({Key key,this.params}):super(key:key);
  final HomeItem params;

  @override
  _HomeItemDetailState createState() => _HomeItemDetailState();
}

class _HomeItemDetailState extends State<HomeItemDetail> {
  
  ItemDetail  _itemDetail;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LogUtil.d(widget.params);
    HomeItemRequest.requestItemDetail(widget.params.sn, 3205).then((value){
      LogUtil.d(value);
      setState(() {
        this._itemDetail = value;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.params.name),
      ),
      body: Stack(
        children: [
          Positioned(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (ctx, index) {
                    return Container(
                      child: _buildItemPage(context),
                    );
                  }),
              left: 0,
              bottom: 20,
              right: 0,
              top: 0),
          Positioned(
              child: Text('dsdssddssddsddssddsds'),
              left: 0,
              bottom: 0,),
        ],
        alignment: Alignment.center,
      )
      );
  }


  Widget _buildItemPage(BuildContext context){
    return Container(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.network(_itemDetail != null?_itemDetail.banner:"https://didi.depin.tech/storage/service/2020/02/26/5e561ce9c4a00.jpg",width: ScreenUtil.screenWidth,height: 200,fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.only(left: 20,top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('价格',style: TextStyle(color: Colors.black45,fontSize: 23),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('¥${_itemDetail != null?this._itemDetail.price:'0'}',style: TextStyle(color: Colors.orange,fontSize: 25),),
                        )
                      ],
                    ),
                    Container(
                      child: Text(this.widget.params.name,style: TextStyle(color: Colors.black45,fontSize: 15),),
                      margin: EdgeInsets.only(right: 16,bottom: 15),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text('购买数量',style: TextStyle(color: Colors.black45,fontSize: 16),),
                      margin: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 16,top: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text("-",style: TextStyle(color: Colors.black45,fontSize: 19,),),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text('1',style: TextStyle(color: Colors.black,fontSize: 22),),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text('+',style: TextStyle(color: Colors.black45,fontSize: 19),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Image.asset("asset/images/home/home_item_detail_group.png",width: 20,height: 20,),
                      Container(
                        child: Text('适宜人群',style: TextStyle(color: Colors.black,fontSize: 17),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 10),
                  alignment: Alignment.centerLeft,
                  child:
                  Text(_itemDetail != null?_itemDetail.crowd:'',style: TextStyle(color: Colors.black,fontSize: 15),textAlign:TextAlign.left),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Image.asset("asset/images/home/home_item_detail_service.png",width: 20,height: 20),
                      Container(
                        child: Text('服务详情',style: TextStyle(color: Colors.black,fontSize: 17),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(_itemDetail != null?_itemDetail.content:'',style: TextStyle(color: Colors.black,fontSize: 15),textAlign:TextAlign.left),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Image.asset("asset/images/home/home_item_detail_note.png",width: 20,height: 20),
                      Container(
                        child: Text('注意事项',style: TextStyle(color: Colors.black,fontSize: 17),),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10,right: 10,bottom: 40),
                  alignment: Alignment.centerLeft,
                  child: Text(_itemDetail != null?_itemDetail.note:'',style: TextStyle(color: Colors.black,fontSize: 15,),textAlign:TextAlign.left,),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
