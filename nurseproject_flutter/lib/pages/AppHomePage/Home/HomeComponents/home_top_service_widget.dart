import 'package:flutter/material.dart';

class home_top_service_widget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildSingleItem("上门体检","年卡优惠","asset/images/home/homeservicepc1.png"),
            buildSingleItem("慢病护理","季卡优惠","asset/images/home/homeservicepc2.png"),
            buildSingleItem("上门注射","10次套餐","asset/images/home/homeservicepc3.png")
          ],
        ),
    );
  }
}

Widget buildSingleItem(String topTitle,String bottomTitle,String imagePath){
  return Container(
//      child: Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//        children: [
//          Text(topTitle,style: TextStyle(fontSize: 19,color: Colors.black),),
//          Container(
//            padding: EdgeInsets.only(top: 4),
//            child: Text(bottomTitle,style: TextStyle(fontSize: 14,color: Colors.orange),),
//          ),
//          Image.asset(imagePath,width: 90,height: 120,fit: BoxFit.cover,)
//        ]
//      ),
        child: Image.asset(imagePath,width: 110,height: 130,fit: BoxFit.cover,),
  );
}

Widget buildBottomWidget(){
  return Container(
    padding: EdgeInsets.only(left: 10,right: 10),
    height: 30,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey,
          height: 1,
        ),
        Container(
          child: Row(
            children: [
              Container(
                child: Text('护理头条',style: TextStyle(color: Colors.orange),),
              ),
              Container(
                color: Colors.grey,
                width: 1,
              ),
              Container(
                child: Text('不懂这一点，只会让你的孩子',style:  TextStyle(color:Colors.black,fontSize: 12),),
              )
            ],
          ),
        )
      ],
    ),
  );

}