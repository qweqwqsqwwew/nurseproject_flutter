import 'package:flutter/material.dart';
import '../../../utils/util.dart';
import '../LoginAndRegister/LoginAndRegisterRequest/LoginModel.dart';
import './RelatedObject_request/RelatedObjectItem.dart';
import './RelatedObject_request/RelatedObjectRequest.dart';
import './RelatedObject_request/related_object_list_entity.dart';

class RelatedObject extends StatefulWidget {
  RelatedObject({Key key, this.params}) : super(key: key);
  final UserModel params;
  @override
  _RelatedObjectState createState() => _RelatedObjectState();
}

class _RelatedObjectState extends State<RelatedObject> {

  RelatedObjectListEntity _relatedList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RelatedObjectRequest.requestRelatedObjectList(widget.params.token).then((value){
      LogUtil.d(value);
      setState(() {
        _relatedList = value;
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
            itemCount: _relatedList == null?0:_relatedList.data.length,
            itemBuilder: (ctx, index) {
              return RelatedObjectItem(_relatedList.data[index]);
            }),
      ),
    );
  }

}


