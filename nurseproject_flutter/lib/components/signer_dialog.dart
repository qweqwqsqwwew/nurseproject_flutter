import 'package:flutter/material.dart';
import 'func.dart';
import 'const.dart';
import 'signer_board_view.dart';
import 'dart:ui' as DartUI;

class SignerDialog extends StatefulWidget {
  // 点击返回index 0 1
  Function onTap;
  //按钮
  List<String> items;

  final Function(DartUI.Image image) sureSignerImage;

  SignerDialog({
    this.onTap,
    @required this.items,
    this.sureSignerImage,
  });
  @override
  _SignerDialogState createState() => _SignerDialogState();
}

class _SignerDialogState extends State<SignerDialog> {
  final _boardKey = GlobalKey<SignerBoardViewState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorConst.Color_Clear,
      child: Center(
        // ClipRRect 创建圆角矩形 要不然发现下边button不是圆角
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            color: ColorConst.Color_Font_White,
            width: (260),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  child: Text(
                    '签名',
                    style: TextStyle(
                        color: ColorConst.Color_Font_Black,
                        fontWeight: FontWeight.bold,
                        fontSize: (17)),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  child: Container(height: 240, child:SignerBoardView(key: _boardKey, penSize: 6.0, boardColor: Colors.white)
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: ColorConst.Color_Split_Line,
                        width: 1,
                      ),
                    ),
                  ),
                ),
                _itemCreat(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemCreat() {
    return Container(
      child: Row(
        children: widget.items.map((res) {
          int index = widget.items.indexOf(res);
          return Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                FunctionUtil.pop(context);
                if(widget.onTap != null){
                  if(index == 1){
                    _boardKey.currentState.capture().then((image) {
                      widget.sureSignerImage(image);
                    }, onError: (error) {
                      debugPrint(error);
                    });
                  }else{
                    widget.onTap(index);
                  }
                }
              },
              child: Container(
                height: 44,
                alignment: Alignment.center,
                child: Text(
                  res,
                  style: TextStyle(
                      color: ColorConst.Color_Font_Black,
                      fontSize: (15)),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: ColorConst.Color_Split_Line,
                      width: 1,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
