import 'package:flutter/material.dart';
import 'dart:async';
import 'package:webview_flutter/webview_flutter.dart';
class CommenWebview extends StatefulWidget {
  CommenWebview({Key key,this.params}):super(key:key);
  final params;
  @override
  _CommenWebviewState createState() => _CommenWebviewState();
}

class _CommenWebviewState extends State<CommenWebview> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.params["title"],style: TextStyle(color: Colors.white),),
      ),
      body: WebView(
        initialUrl: widget.params["url"],
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }

}
