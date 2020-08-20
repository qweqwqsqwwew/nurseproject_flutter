import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class Login extends StatefulWidget {
  Login({Key key, this.params}) : super(key: key);
  final params;
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
        title: Text('登录',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: Text('登录界面'),
      ),
    );
  }
}
