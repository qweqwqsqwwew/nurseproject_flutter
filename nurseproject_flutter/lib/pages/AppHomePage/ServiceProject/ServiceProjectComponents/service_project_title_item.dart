import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/ServiceProject/service_project_request/service_project_cate_model.dart';
import 'package:nurseproject_flutter/utils/util.dart';
import 'package:provider/provider.dart';
import 'package:nurseproject_flutter/provider/appCommenNetData.dart';

class ServiceProjectTitleItem extends StatelessWidget {
  
  final ServiceCateItem item;
  final int clickIndex;
  ServiceProjectTitleItem(this.item,this.clickIndex);
  ServiceItemList _serviceItemListProvider;
  
  @override
  Widget build(BuildContext context) {
    _serviceItemListProvider = Provider.of<ServiceItemList>(context);
    return Container(
//      width: 100,
      height: 40,
        child: GestureDetector(
          child: Text(this.item.title,style: TextStyle(color: _serviceItemListProvider.getCurrentCllickIndex == this.clickIndex?Colors.orange:Colors.black,fontSize: ScreenAdaper.sp(30)),textAlign: TextAlign.center,),
          onTap: (){
            _serviceItemListProvider.setCurrentClickIndex(this.clickIndex);
          },
        ),
//      child: Text(this.item.title,style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),textAlign: TextAlign.center,),
    );
  }
}
