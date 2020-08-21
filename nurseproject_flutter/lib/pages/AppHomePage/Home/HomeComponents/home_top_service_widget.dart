import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/utils/util.dart';
class home_top_service_widget extends StatelessWidget{

  final List home_set_list;
  home_top_service_widget(this.home_set_list);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
              Container(
              padding: const EdgeInsets.only(left: 30,right: 30,top: 10),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: buildSingleItem("上门体检","年卡优惠","asset/images/home/homeservicepc1.png"),
                      onTap: (){
                        Navigator.pushNamed(
                          context,
                          '/homeItemDetail',
                          arguments: home_set_list[0], //　传递参数
                        );
                      },
                  ),
                  GestureDetector(
                    child: buildSingleItem("慢病护理","季卡优惠","asset/images/home/homeservicepc2.png"),
                    onTap: (){
                      Navigator.pushNamed(
                        context,
                        '/homeItemDetail',
                        arguments: home_set_list[1], //　传递参数
                      );
                    },
                  ),
                  GestureDetector(
                    child: buildSingleItem("上门注射","10次套餐","asset/images/home/homeservicepc3.png"),
                    onTap: (){
                      Navigator.pushNamed(
                        context,
                        '/homeItemDetail',
                        arguments: home_set_list[2], //　传递参数
                      );
                    },
                  ),
                ],
              ),
            ),
          buildBottomWidget()
        ],
      ),
    );
  }
}

Widget buildSingleItem(String topTitle,String bottomTitle,String imagePath){
  return Container(
        child: Image.asset(imagePath,width: ScreenAdaper.width(180),height: ScreenAdaper.height(200),fit: BoxFit.cover,),
  );
}

Widget buildBottomWidget(){
  return Container(
    padding: EdgeInsets.only(left: 20,right: 20,top: 10),
    height: ScreenAdaper.height(210),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: Colors.grey,
          height: 0.5,
        ),
        Container(
          child: Row(
            children: [
              Container(
                child: Text('护理头条',style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(34)),),
                padding: EdgeInsets.only(left: 10,top: 10),
              ),
              Container(
//                padding: EdgeInsets.only(top: 20,left: 5,right: 10),
                margin: EdgeInsets.only(top: 10,left: 5,right: 5),
                height: ScreenAdaper.height(45),
                color: Colors.grey,
                width: 0.5,
              ),
              Container(
                margin: EdgeInsets.only(left: 5,top: 10),
                child: Text('不懂这一点，只会让你的孩子拉...',style:  TextStyle(color:Colors.black,fontSize: ScreenAdaper.sp(30)),),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          margin: EdgeInsets.only(top: 9),
          height: 0.5,
        ),
        Container(
          height: ScreenAdaper.height(80),
          margin: EdgeInsets.only(top: 8),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 1,top: 5,bottom: 5,right: 10),
                color: Colors.orange,
                width: 1,
              ),
              Container(
                child: Text('热门服务',style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(32)),),
              )
            ],
          ),
        )
      ],
    ),
  );

}