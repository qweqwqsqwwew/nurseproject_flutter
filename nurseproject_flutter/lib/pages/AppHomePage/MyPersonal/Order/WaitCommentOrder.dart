import 'package:flutter/material.dart';

class WaitCommentOrder extends StatefulWidget {
  @override
  _WaitCommentOrderState createState() => _WaitCommentOrderState();
}

class _WaitCommentOrderState extends State<WaitCommentOrder>  with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('待评论订单'),
    );
  }
}
