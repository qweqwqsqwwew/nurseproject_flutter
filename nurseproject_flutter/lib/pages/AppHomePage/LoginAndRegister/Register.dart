import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class Register extends StatefulWidget {
  Register({Key key, this.params}) : super(key: key);
  final params;
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

//  @override
//  bool get wantKeepAlive => true;
  final textEditingController = TextEditingController();


  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册',style: TextStyle(color: Colors.white),),
        ),
         body:ListView(
           children: List.generate(3, (index) {
             return _judgeItemFromIndex(context, index);
           }),
         ),
    );
  }

  Widget _judgeItemFromIndex(BuildContext context,int index){
    switch (index){
      case 0:{
        return Container(
          child: Column(
            children: [

            ],
          ),
        );
      }
      break;
      case 1:{

      }
      break;
      case 2:{

      }
      break;
      case 3:{

      }
      break;
      case 4:{

      }
      break;
      default:{

      }
      break;
    }
  }
}
