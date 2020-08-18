import 'package:flutter/material.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/ServiceProject/service_project_request/service_project_cate_model.dart';
class ServiceProjectTitleItem extends StatelessWidget {
  
  final ServiceCateItem item;
  ServiceProjectTitleItem(this.item);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.item.title,style: TextStyle(color: Colors.black87,fontSize: 18),),
    );
  }
}
