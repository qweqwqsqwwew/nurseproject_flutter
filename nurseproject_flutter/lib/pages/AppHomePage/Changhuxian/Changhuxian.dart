import '../../../utils/util.dart';
import 'package:flutter/material.dart';

class Changhuxian extends StatefulWidget {
  Changhuxian({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Changhuxian> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

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
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('长互险页面'),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '长互险页面',
                  style: TextStyle(fontSize: 32),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
