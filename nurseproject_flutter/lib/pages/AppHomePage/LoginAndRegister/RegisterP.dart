import 'package:flutter/material.dart';
import '../../../utils/util.dart';
class RegisterP extends StatefulWidget {
  RegisterP({Key key, this.params}) : super(key: key);
  final params;
  @override
  _RegisterPState createState() => _RegisterPState();
}

class _RegisterPState extends State<RegisterP> {

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }

  @override
  void dispose() {
    super.dispose();
    _unameController.dispose();
    _pwdController.dispose();
    _yanzhengController.dispose();
    _tuiguangController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('注册',style: TextStyle(color: Colors.white),),
        ),
         body:GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
    // 触摸收起键盘
                FocusScope.of(context).requestFocus(FocusNode());
                },
             child:   ListView(
              children: List.generate(5, (index) {
              return _judgeItemFromIndex(context, index);
               }),
          ),
      ),
    );
  }
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  TextEditingController _yanzhengController = new TextEditingController();
  TextEditingController _tuiguangController = new TextEditingController();

  Widget _judgeItemFromIndex(BuildContext context,int index){
    switch (index){
      case 0:{
        return  TextFormField(
            autofocus: false,
            controller: _unameController,
            decoration: InputDecoration(
                labelText: "手机号",
                hintText: "请输入手机号",
                icon: Icon(Icons.person)
            ),
            // 校验用户名
            validator: (v) {
              return v
                  .trim()
                  .length > 10 ? null : "手机号填写格式不对";
            }

        );
      }
      break;
      case 1:{
        return   TextFormField(
            controller: _pwdController,
            decoration: InputDecoration(
                labelText: "密码",
                hintText: "请输入密码密码",
                icon: Icon(Icons.lock)
            ),
            obscureText: true,
            //校验密码
            validator: (v) {
              return v
                  .trim()
                  .length > 5 ? null : "密码不能少于6位";
            }
        );
      }
      break;
      case 2:{
        return TextFormField(
            controller: _yanzhengController,
            decoration: InputDecoration(
                labelText: "验证码",
                hintText: "请输入验证码",
                icon: Icon(Icons.assignment),
                suffixIcon:Container(
                  child: RaisedButton(
                    child: Text("发送验证码"),
                    onPressed: () {},
                  ),
                )
            ),
            //校验密码
            validator: (v) {
              return v
                  .trim()
                  .length > 5 ? null : "密码不能少于6位";
            }
        );
      }
      break;
      case 3:{
        return TextFormField(
            controller: _tuiguangController,
            decoration: InputDecoration(
                labelText: "推广码",
                hintText: "请输入推广码",
                icon: Icon(Icons.movie_creation),
                suffixIcon:Container(
                  child: RaisedButton(
                    child: Icon(Icons.tablet_mac),
                    onPressed: () {},
                  ),
                )
            ),
            //校验密码
            validator: (v) {
              return v
                  .trim()
                  .length > 5 ? null : "密码不能少于6位";
            }
        );
      }
      break;
      case 4:{
        return Container(
          width: ScreenAdaper.screenWidth(),
          child: Container(
          margin: EdgeInsets.only(top: ScreenAdaper.height(100),bottom: ScreenAdaper.height(100)),
            width: ScreenAdaper.width(100),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
              child: Container(
                  width: ScreenAdaper.screenWidth() - ScreenAdaper.width(100),
                  color: Colors.orange,
                  height: ScreenAdaper.height(70),
                  alignment: Alignment.center,
                  child: GestureDetector(
                    child: Text('注册',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                    onTap: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
              ),
            ),
          ),
        );
      }
      break;
      default:{
        return Container();
      }
      break;
    }
  }
}
