import 'package:flutter/material.dart';
import '../../../../utils/util.dart';

class HomeServiceInformation extends StatefulWidget {
  HomeServiceInformation({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _HomeServiceInformationState createState() => _HomeServiceInformationState();
}

class _HomeServiceInformationState extends State<HomeServiceInformation> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("服务对象信息"),
      ),
      body: Container(
        child: Text("服务对象信息界面"),
      ),
    );
  }
}
