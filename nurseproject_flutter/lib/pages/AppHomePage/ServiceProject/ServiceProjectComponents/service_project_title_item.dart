import 'package:flutter/material.dart';

class ServiceProjectTitleItem extends StatelessWidget {
  
  final String title;
  ServiceProjectTitleItem(this.title);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.title,style: TextStyle(color: Colors.black87,fontSize: 18),),
    );
  }
}
