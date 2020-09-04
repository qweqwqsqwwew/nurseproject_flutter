import 'package:flutter/material.dart';
import 'related_object_list_entity.dart';
class RelatedObjectItemDetail extends StatefulWidget {
  RelatedObjectItemDetail({Key key, this.params}) : super(key: key);
  final RelatedObjectListData  params;
  @override
  _RelatedObjectItemDetailState createState() => _RelatedObjectItemDetailState();
}

class _RelatedObjectItemDetailState extends State<RelatedObjectItemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关联对象'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text('关联对象页面'),
      ),
    );
  }
}
