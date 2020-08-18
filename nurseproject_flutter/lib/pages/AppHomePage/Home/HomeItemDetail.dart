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
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (ctx, index) {
            return Container(
              child: _buildItemPage(context),
            );
          })
    );
  }


  Widget _buildItemPage(BuildContext context){
    return Container(

      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Image.network(this._itemDetail.banner,width: ScreenUtil.screenWidth,height: 200,fit: BoxFit.cover,),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Text('价格',style: TextStyle(color: Colors.black12,fontSize: 13),),
                        ),
                        Container(
                          child: Text('¥${this._itemDetail.price}',),
                        )
                      ],

                    ),
                    Container(
                      child: Text(this.widget.params.name,style: TextStyle(color: Colors.black12,fontSize: 15),),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('购买数量',style: TextStyle(color: Colors.black12,fontSize: 13),),
                    Text("-",style: TextStyle(color: Colors.black12,fontSize: 13),),
                    Text('1',style: TextStyle(color: Colors.black,fontSize: 15),),
                    Text('+',style: TextStyle(color: Colors.black12,fontSize: 13),)
                  ],
                ),
                Row(
                  children: [
                    Image.asset("asset/images/home/home_item_detail_group.png",width: 20,height: 20,),
                    Container(
                      child: Text('适宜人群',style: TextStyle(color: Colors.black,fontSize: 16),),
                    )
                  ],
                ),
                Container(
                  child: Text(this._itemDetail.crowd,style: TextStyle(color: Colors.black,fontSize: 14),),
                ),
                Row(
                  children: [
                    Image.asset("asset/images/home/home_item_detail_group.png",width: 20,height: 20),
                    Container(
                      child: Text('服务详情',style: TextStyle(color: Colors.black,fontSize: 16),),
                    )
                  ],
                ),
                Container(
                  child: Text(this._itemDetail.content,style: TextStyle(color: Colors.black,fontSize: 14),),
                ),
                Row(
                  children: [
                    Image.asset("asset/images/home/home_item_detail_group.png",width: 20,height: 20),
                    Container(
                      child: Text('注意事项',style: TextStyle(color: Colors.black,fontSize: 16),),
                    )
                  ],
                ),
                Container(
                  child: Text(this._itemDetail.note,style: TextStyle(color: Colors.black,fontSize: 14),),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
