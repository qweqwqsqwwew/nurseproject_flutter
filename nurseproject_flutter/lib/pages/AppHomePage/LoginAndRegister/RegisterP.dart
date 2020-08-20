import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class RegisterP extends StatefulWidget {
  RegisterP({Key key, this.params}) : super(key: key);
  final params;
  @override
  _RegisterPState createState() => _RegisterPState();
}

class _RegisterPState extends State<RegisterP> {

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册',style: TextStyle(color: Colors.white),),
        ),
         body:ListView(
           children: List.generate(5, (index) {
             return _judgeItemFromIndex(context, index);
           }),
         ),
    );
  }

  Widget _judgeItemFromIndex(BuildContext context,int index){
    switch (index){
      case 0:{
        return TextField(
          keyboardType: TextInputType.phone,
          maxLines: 1,
          autofocus: false,
          cursorColor: Colors.blue,
          maxLength: 11,
          maxLengthEnforced: true,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "请输入手机号码",
            labelText: "手机号",
            prefixIcon: Icon(Icons.phone),
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            //获得焦点下划线设为蓝色
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        );
      }
      break;
      case 1:{
        return TextField(
          keyboardType: TextInputType.phone,
          maxLines: 1,
          autofocus: false,
          cursorColor: Colors.blue,
          maxLength: 11,
          maxLengthEnforced: true,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "请输入手机号码",
            labelText: "手机号",
            prefixIcon: Icon(Icons.phone),
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            //获得焦点下划线设为蓝色
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        );
      }
      break;
      case 2:{
        return TextField(
          keyboardType: TextInputType.phone,
          maxLines: 1,
          autofocus: false,
          cursorColor: Colors.blue,
          maxLength: 11,
          maxLengthEnforced: true,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "请输入手机号码",
            labelText: "手机号",
            prefixIcon: Icon(Icons.phone),
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            //获得焦点下划线设为蓝色
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        );
      }
      break;
      case 3:{
        return TextField(
          keyboardType: TextInputType.phone,
          maxLines: 1,
          autofocus: false,
          cursorColor: Colors.blue,
          maxLength: 11,
          maxLengthEnforced: true,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "请输入手机号码",
            labelText: "手机号",
            prefixIcon: Icon(Icons.phone),
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            //获得焦点下划线设为蓝色
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        );
      }
      break;
      case 4:{
        return TextField(
          keyboardType: TextInputType.phone,
          maxLines: 1,
          autofocus: false,
          cursorColor: Colors.blue,
          maxLength: 11,
          maxLengthEnforced: true,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "请输入手机号码",
            labelText: "手机号",
            prefixIcon: Icon(Icons.phone),
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            //获得焦点下划线设为蓝色
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        );
      }
      break;
      default:{
        return Container();
      }
      break;
    }
  }
}
