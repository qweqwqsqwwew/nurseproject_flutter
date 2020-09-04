import 'package:flutter/material.dart';
import '../../../../utils/util.dart';
import '../home_item_request/home_item_detail_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../AppHomePage/MyPersonal/RelatedObject_request/related_object_list_entity.dart';
import '../../../../provider/appCommenNetData.dart';
import 'package:provider/provider.dart';
import '../../MyPersonal/RelatedObject_request/DottedLineWidget.dart';
import '../../Commen/text_field.dart';
import 'package:nurseproject_flutter/components/flutter_jd_address_selector.dart';
import 'hospital_model_entity.dart';
import '../home_request/home_request.dart';
import '../../../../components/images_picker/images_gridview_widget.dart';
import 'hospitai_xi_yi_model_entity.dart';
import '../../../../components/signer_dialog.dart';
import '../../../../components/func.dart';
import 'dart:typed_data';
import 'dart:ui' as DartUI;
class HomeServiceInformation extends StatefulWidget {
  HomeServiceInformation({Key key, this.params}) : super(key: key);
  final ItemDetail params;
  @override
  _HomeServiceInformationState createState() => _HomeServiceInformationState();
}

class _HomeServiceInformationState extends State<HomeServiceInformation> {

  GainRelationObjectList _relationObjectListProvider;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _qingkuangController = TextEditingController();

  //分别定义两个输入框的焦点 用于切换焦点
  final FocusNode _nodeName = FocusNode();
  final FocusNode _nodeMobile = FocusNode();
  final FocusNode _nodeQingkuang = FocusNode();

  RelatedObjectListData _selectRelationPersion;

  bool _isJiaJi = false;

  HospitalModelList _selectJiGou = null;

  ///签名图片
  DartUI.Image _signerImage = null;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _mobileController.dispose();
    _qingkuangController.dispose();
  }

  _dealWithRelationList(BuildContext context){
    _relationObjectListProvider  = Provider.of<GainRelationObjectList>(context);
    if(_relationObjectListProvider.getRelateListModel == null){
      _relationObjectListProvider.setRelationList();
    }
  }

  @override
  Widget build(BuildContext context) {
    _dealWithRelationList(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("服务对象信息"),
      ),
      body:GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              },
          child:
                Stack(
                  children: [
                    Positioned(
                        child: Container(
                            child: ListView.builder(
                                      itemCount: 1,
                                      itemBuilder: (ctx, index) {
                                        return _buildServiceObjectInfomationItem(context);
                                      })
                        ),
                        left: 0,
                        bottom: ScreenAdaper.height(100),
                        right: 0,
                        top: 0),
                    Positioned(
                      child: _buildBottomTool(),
                      left: 0,
                      bottom: 0,),
                  ],
                  alignment: Alignment.center,
                )
             )
    );
  }

  Widget _buildBottomTool(){
    return Container(
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              height: ScreenAdaper.height(100),
              width: ScreenAdaper.screenWidth()/2.0,
              alignment: Alignment.center,
              color: Colors.white54,
              child: Text("费用:${widget.params.price}",style: TextStyle(color: Colors.orange),),
              ///Navigator.pop(context);
            ),
            onTap: (){
//              Navigator.pop(context);
            },
          ),
          GestureDetector(
            child: Container(
              height: ScreenAdaper.height(100),
              width: ScreenAdaper.screenWidth()/2.0,
              alignment: Alignment.center,
              color: Colors.orange,
              child: Text("确认预约",style: TextStyle(color: Colors.white),),
            ),
            onTap: (){
//              Navigator.pushNamed(
//                context,
//                '/payPreOrder',
//                arguments: this._detailParams, //　传递参数
//              );
            },
          )
        ],
      ),
    );

  }

  void _choiceHospitalDialog(List titleList) async {
    print('======');
    List titleArr = [];
    titleList.forEach((element) {
      titleArr.add(element.name);
    });
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return JDAddressDialog(
              onSingleSelected: (title) {
                titleList.forEach((element) {
                  if(element.name == title){
                    _selectJiGou = element;
                  }
                });
                setState(() {});
              },
              title: '选择机构',
              titleArr: titleArr,
              selectedColor: Colors.red,
              unselectedColor: Colors.black);
        });
  }

  Widget _buildServiceObjectInfomationItem(BuildContext context){
    return Container(
      padding: EdgeInsets.only(left: ScreenAdaper.width(20),right: ScreenAdaper.width(20),top: ScreenAdaper.height(20)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(15)),
            child: Row(
              children: [
                CachedNetworkImage(errorWidget: (context, url, error) => Icon(Icons.error),fit: BoxFit.fill,imageUrl: widget.params.logo!=null? widget.params.logo:"https://didi.depin.tech/storage/service/2020/02/26/5e561ce9c4a00.jpg",width: ScreenAdaper.width(160),height: ScreenAdaper.height(160),),
                Container(
                  margin:EdgeInsets.only(left: ScreenAdaper.width(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(child: Text(widget.params.name,style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),margin: EdgeInsets.only(top: 0,bottom: ScreenAdaper.height(10)),),
                      SizedBox(height: ScreenAdaper.height(20),),
                      Text("适应人群:${widget.params.crowd}",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
                      SizedBox(height: ScreenAdaper.height(20),),
                      Text("¥${widget.params.price}",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("选择关联对象",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
          ),
          SizedBox(height: ScreenAdaper.height(20),),
          Container(
            width: ScreenAdaper.screenWidth(),
            height:ScreenAdaper.height(250),
            child:Consumer<GainRelationObjectList>(
              builder: (_, a, child) =>
                  GridView.builder(
                    physics: new NeverScrollableScrollPhysics(),
                    itemCount: _relationObjectListProvider.getRelateListModel == null? 0:_relationObjectListProvider.getRelateListModel.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Widget Function(BuildContext context, int index)
                      return _buildGridViewItem(context,_relationObjectListProvider.getRelateListModel.data[index]);
                    },
                    //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                        crossAxisCount: 4,
                        //纵轴间距
                        mainAxisSpacing: ScreenAdaper.width(30),
                        //横轴间距
                        crossAxisSpacing: ScreenAdaper.height(40),
                        //子组件宽高长度比例
                        childAspectRatio: 3),
                  ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("关联信息",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
            margin: EdgeInsets.only(bottom: ScreenAdaper.height(10)),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
           children: [
             Container(
               margin: EdgeInsets.only(left: ScreenAdaper.width(5),top: ScreenAdaper.height(5),bottom: ScreenAdaper.height(5)),
               child: Text("服务详细地址:",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
             ),
             Container(
               margin: EdgeInsets.only(left: ScreenAdaper.width(10)),
               child: Text(_relationObjectListProvider.getSelectRelationModel == null ? "":_relationObjectListProvider.getSelectRelationModel.address,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
             ),
           ],
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: ScreenAdaper.height(10)),
              child: Text("主照料人",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          SizedBox(),
          MyTextField(
            focusNode: _nodeName,
            placeHolder: '请输入关联人姓名',
            maxLength: 5,
            keyboardType: TextInputType.text,
            controller: _nameController,
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          MyTextField(
            focusNode: _nodeMobile,
            placeHolder: '请输入关联人手机号',
            maxLength: 11,
            keyboardType: TextInputType.phone,
            controller: _mobileController,
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: ScreenAdaper.height(10)),
                child: Text("订单信息",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(bottom: ScreenAdaper.height(10)),
                child: Text("待预约",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),),
              ),
            ],
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("服务机构",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
                ),
                FlatButton(
                    onPressed: (){
                      LogUtil.d("点击了选择医院");
                      if(_relationObjectListProvider.getSelectRelationModel == null){
                        ToasrShow.show("请先选择关联的病人");
                        return;
                      }
                      HomeServiceInformationRequest.requestHospitalData(_relationObjectListProvider.getSelectRelationModel.cityId.toString(), widget.params.id).then((value){
                        if(value != null){
                          _choiceHospitalDialog((value as HospitalModelEntity).xList);
                        }
                      });
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(_selectJiGou==null?'选择机构':_selectJiGou.name,style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
                        ),
                        Image.asset("asset/images/mine/jiantou.png",width: ScreenAdaper.width(25),height: ScreenAdaper.height(25),fit: BoxFit.fill,),
                      ],
                    )
                ),
              ],
            ),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("加急费（自选）",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Checkbox(
                    value: _isJiaJi,
                    activeColor: Colors.orange,
                    onChanged: (bool val) {
                      // val 是布尔值
                      setState(() {
                        _isJiaJi = !_isJiaJi;
                      });
                    },
                  ),
                  Text("¥0.01元",style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(23)),),
                ],
              ),
            ],
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("注：如未按约定时间上门服务，可退还加急费",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
          ),
          SizedBox(height: ScreenAdaper.height(20),),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("服务时间",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
                ),
                FlatButton(
                    onPressed: (){
                      LogUtil.d("点击了选择时间");
                    },
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text("2020-09-03 10:00:00",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
                        ),
                        Image.asset("asset/images/mine/jiantou.png",width: ScreenAdaper.width(25),height: ScreenAdaper.height(25),fit: BoxFit.fill,),
                      ],
                    )
                ),
              ],
            ),
          ),
          DottedLineWidget(axis: Axis.horizontal,
            width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
            height: 10.0,
            lineHeight: 0.5,
            lineWidth: 3,
            count: 40,
            color: Colors.black45,),
          Row(
            children: [
              Container(
                child: Text("*注",style: TextStyle(color: Colors.red,fontSize: ScreenAdaper.sp(30)),),
              ),
              Container(
                width: ScreenAdaper.width(650),
                margin: EdgeInsets.only(left: ScreenAdaper.width(10)),
                child: Text("此机构包含基础服务费，服务费0.01元,起步价0.01元（5公里内），每公里增加0.01元",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),maxLines: 2,),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          SizedBox(height: ScreenAdaper.height(10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("保险信息",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
              Container(
                margin: EdgeInsets.only(left: ScreenAdaper.width(10)),
                child: Text("免费为服务对象投保中国人保意外保险",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
              ),
            ],
          ),
          SizedBox(height: ScreenAdaper.height(10),),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text("情况描述",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
          ),
          Container(
            child: MyTextField(
              focusNode: _nodeQingkuang,
              placeHolder: '请输入情况描述',
              maxLength: 100,
              keyboardType: TextInputType.text,
              controller: _qingkuangController,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text("最多输入一百字",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          Container(
            child: Text("上传辅助资料",style: TextStyle(color: Colors.black87,fontSize: ScreenAdaper.sp(30)),),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: ScreenAdaper.height(10),),
          Container(
            child: ImagesGridviewWidget(
              onSelectedImageList: (imageList){
                LogUtil.d(imageList.length);
              },
            ),
          ),
          SizedBox(height: ScreenAdaper.height(10),),
          Text("请上传近期医嘱，病历。检验单，以便医护人员全面了解情况。",style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(23)),),
          Row(
            children: [
              FlatButton(onPressed: (){
                LogUtil.d("点击了有护理工具");
              }, child: Text("有护理工具")),
              FlatButton(onPressed: (){
                LogUtil.d("点击了有药品");
              }, child: Text("有药品")),
              FlatButton(onPressed: (){
                LogUtil.d("点击了有医嘱");
              }, child: Text("有医嘱")),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenAdaper.height(20),bottom: ScreenAdaper.height(20)),
            height: ScreenAdaper.height(10),
            color: Color(0xFFFCE4EC),
          ),
          Row(
            children: [
              Text('我已阅读'),
              GestureDetector(
                child: Text("《知情同意书》",style: TextStyle(color: Colors.orange),),
                onTap: (){
                  if(_selectJiGou == null){
                    ToasrShow.show("请选择服务机构");
                    return;
                  }
                  LogUtil.d('------------------ssss');
                  HomeServiceInformationRequest.requestHospitalXiYi(_selectJiGou.id.toString()).then((value){
                    if(value != null){
                      Navigator.pushNamed(
                        context,
                        '/commmenWebview',
                        arguments: {"url":(value as HospitaiXiYiModelEntity).url,"title":(value as HospitaiXiYiModelEntity).title}, //　传递参数
                      );
                    }
                  });
                },
              ),
              Text(","),
              GestureDetector(
                child: Text("点击此处",style: TextStyle(color: Colors.orange),),
                onTap: (){
                  LogUtil.d("-------点击了签名");
                  FunctionUtil.popDialog(
                    context,
                    SignerDialog(
                      items: ['取消', '确认'],
                      onTap: (index) {
                        LogUtil.d('object$index');
                        if(index == 1){

                        }
                      },
                      sureSignerImage:(image){
                        setState(() {
                          _signerImage = image;
                        });
                      },
                    ),
                  );
                },
              ),
              Text("签字确认"),
            ],
          ),
          SizedBox(height: ScreenAdaper.height(70),),
          _isShowSigner(_signerImage),
          SizedBox(height: ScreenAdaper.height(90),),
        ],
      ),
    );
  }

  Widget _isShowSigner(image){
    if(_signerImage == null){
      return Text("此处为签字");
    }else{
      return Container(
        child:FutureBuilder<Widget>(
          future: showImage(image),
          builder: (BuildContext context, AsyncSnapshot snapshot){
          // 请求已结束
            if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasError){
              return Text("此处为签字");
            }else{
            // 请求成功，显示数据
              Widget image = snapshot.data;
                 return image;
            }
             }else{
                  return Text("此处为签字");
            }
          }
      )
      );
    }
  }

   Future<Widget> showImage(DartUI.Image image) async {
    var pngBytes = await image.toByteData(format: DartUI.ImageByteFormat.png);
    return Image.memory(Uint8List.view(pngBytes.buffer));
  }

  Widget _buildGridViewItem(BuildContext context,RelatedObjectListData item){
    return Container(
      child: Consumer<GainRelationObjectList>(
        builder: (_, a, child) =>
                    RaisedButton(
      //        shape: CircleBorder(),
              color: _relationObjectListProvider.getSelectRelationModel == null?Colors.white:_relationObjectListProvider.getSelectRelationModel.id==item.id?Colors.orange:Colors.white,
              child: Text(item.realname,style: TextStyle(color: _relationObjectListProvider.getSelectRelationModel == null?Colors.black87:_relationObjectListProvider.getSelectRelationModel.id==item.id?Colors.white:Colors.black87,fontSize: ScreenAdaper.sp(23)),),
              onPressed: (){
                LogUtil.d("点击了");
                _selectRelationPersion = item;
              _relationObjectListProvider.setSelectRelationModel(item);
              },
            )
      ),
    );
  }

}
