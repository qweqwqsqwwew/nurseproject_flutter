import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import './RelatedObject_request/RelatedObjectItemModel.dart';
import './RelatedObject_request/RelatedObjectItem.dart';
import './RelatedObject_request/RelatedObjectRequest.dart';

class RelatedObject extends StatefulWidget {
  RelatedObject({Key key, this.params}) : super(key: key);
  final UserModel params;
  @override
  _RelatedObjectState createState() => _RelatedObjectState();
}

class _RelatedObjectState extends State<RelatedObject> {

  List<RelatedObjectItemModel> _relatedList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RelatedObjectRequest.requestRelatedObjectList(widget.params.token).then((value){
      LogUtil.d(value);
      _relatedList = [];
      setState(() {
        _relatedList.addAll(value);
      });
    });
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
        title: Text('关联对象',style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _relatedList.length,
            itemBuilder: (ctx, index) {
              return RelatedObjectItem(_relatedList[index]);
            }),
      ),
    );
  }

}


