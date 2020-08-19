import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/ioc/locator.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/utils/util.dart';
class home_item_widget extends StatelessWidget{
  
  final HomeItem homeSingleItem;
  home_item_widget(this.homeSingleItem);

  @override
  Widget build(BuildContext context) {
      return Container(
//        height: 70,
        padding: EdgeInsets.only(left: 10,right: 10),

        child: Container(
          child: Row(
            children: [
              Container(
                  child: Image.network(homeSingleItem.logo!=null?homeSingleItem.logo:"https://didi.depin.tech/storage/service/2020/02/26/5e561ce9c4a00.jpg",width: ScreenAdaper.width(160),height: ScreenAdaper.height(160),)
              ),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: ScreenAdaper.height(25),left: ScreenAdaper.width(18)),
                        child: Text(homeSingleItem.name,style: TextStyle(color: Colors.black,fontSize: 15),textAlign:TextAlign.left),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5,left: 10),
                        width: ScreenAdaper.width(520),
                        height: ScreenAdaper.height(70),
                        child: Text(homeSingleItem.intro,maxLines:2,style: TextStyle(color: Colors.black45,fontSize: 12,),),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Text('${homeSingleItem.price}元',style: TextStyle(color: Colors.orange,fontSize: 13),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: ScreenAdaper.width(330)),
                          child: Text('已服务${homeSingleItem.sale_num}次',style: TextStyle(color: Colors.black45,fontSize: 10),),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
      );
  }
}