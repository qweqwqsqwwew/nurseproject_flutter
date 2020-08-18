import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/ioc/locator.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
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
                  child: Image.network(homeSingleItem.logo!=null?homeSingleItem.logo:"https://didi.depin.tech/storage/service/2020/02/26/5e561ce9c4a00.jpg",width: 80,)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15,left: 10),
                    child: Text(homeSingleItem.name,style: TextStyle(color: Colors.black,fontSize: 15),textAlign:TextAlign.left),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5,left: 10),
                    width: ScreenUtil().setWidth(550),
                    height: 37,
                    child: Text(homeSingleItem.intro,style: TextStyle(color: Colors.black12,fontSize: 12),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10,top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Text('${homeSingleItem.price}元',style: TextStyle(color: Colors.orange,fontSize: 13),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 230),
                          child: Text('已服务${homeSingleItem.sale_num}次',style: TextStyle(color: Colors.black12,fontSize: 10),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      );
  }
}