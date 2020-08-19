import 'package:nurseproject_flutter/pages/AppHomePage/Home/Home.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import '../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nurseproject_flutter/provider/appCommenNetData.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/ServiceProject/service_project_request/service_project_cate_model.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/ServiceProject/service_project_request/service_project_request.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/ServiceProject/ServiceProjectComponents/service_project_title_item.dart';
class ServiceProject extends StatefulWidget {

  ServiceProject({Key key, this.params}) : super(key: key);
  final params;
  
  @override
  _ServiceProjectState createState() => _ServiceProjectState();
}

class _ServiceProjectState extends State<ServiceProject>  with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  ServiceItemList _serviceItemListProvider;
  List<HomeItem> _serviceRealList = [];
  List<ServiceCateItem> _cateList = [];
  int _currentClickIndex = 0;
  @override
  void dispose() {
    super.dispose();
    LogUtil.d('data');
  }

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
    ServiceProjectCateRequest.requestServiceCateList().then((value){
      setState(() {
        _cateList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('服务项目',style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading:false
      ),
      body:
//      ListView(
//        children: List.generate(1, (index) {
//          return Container(
//            child:Consumer<ServiceItemList>(
//                              builder: (_, a, child) => Text(
//                                '状态共享值：${_serviceItemListProvider.getserviceList.length == 0?'wwwww':_serviceItemListProvider.getserviceList[0].name}',
//                                style: TextStyle(fontSize: 18),
//                              ),
//                            ),
//          );
//        }),
//      ),
    _setupServicePage(context)
    );
  }

  Widget _setupServicePage(BuildContext context){
    return Container(
      child: Row(
        children: [
              Container(
                width: ScreenAdaper.width(200),
                margin: EdgeInsets.only(top: ScreenAdaper.width(30),left: ScreenAdaper.width(10)),
                child: ListView.builder(
                    itemCount: _cateList.length,
                    itemBuilder: (ctx, index) {
                      return ServiceProjectTitleItem(_cateList[index],index);
                    }),
              ),
          _buildRightDetailWidget(context,0)
        ],
      ),
    );
  }

  _dealWithClickData(BuildContext context, int Index){
    _serviceItemListProvider = Provider.of<ServiceItemList>(context);
    if(_serviceItemListProvider.getserviceList.length == 0){
      _serviceItemListProvider.getServiceItemsList();
    }else{
      if (_cateList.length>0){
        List<HomeItem> totalData = _serviceItemListProvider.getserviceList;
        _currentClickIndex = _serviceItemListProvider.getCurrentCllickIndex;
        ServiceCateItem cateItem = _cateList[_currentClickIndex];
        _serviceRealList = [];
        for (HomeItem item in totalData){
          if (item.cate_id == cateItem.id){
            _serviceRealList.add(item);
            LogUtil.d('---------------d------------${item.cate_id}');
          }
        }
      }
    }
  }

  Widget _buildRightDetailWidget(BuildContext context, int index){
    _dealWithClickData(context, index);
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: ScreenAdaper.width(15)),
            width: ScreenAdaper.screenWidth()-ScreenAdaper.width(250),
            height: ScreenAdaper.height(230),
            child: Image.network(_cateList.length == 0?"https://didi.depin.tech/storage/service/2020/02/26/5e561ce9c4a00.jpg":_cateList[_currentClickIndex].banner),
          ),
          Container(
            width: ScreenAdaper.screenWidth()-ScreenAdaper.width(250),
            height: ScreenAdaper.screenHeight() - ScreenAdaper.height(540),
            child:Consumer<ServiceItemList>(
              builder: (_, a, child) =>
//                  Text(
//                '状态共享值：${_serviceItemListProvider.getserviceList.length == 0?'wwwww':_serviceItemListProvider.getserviceList[0].name}',
//                style: TextStyle(fontSize: 18),
//              ),
                  GridView.builder(

//                    padding: EdgeInsets.all(10.0),
                    itemCount: _serviceRealList.length,
                    itemBuilder: (BuildContext context, int index) {
                      //Widget Function(BuildContext context, int index)
                      return _buildGridViewItem(_serviceRealList[index]);
                    },
                    //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      //横轴元素个数
                        crossAxisCount: 3,
                        //纵轴间距
                        mainAxisSpacing: ScreenAdaper.width(10),
                        //横轴间距
                        crossAxisSpacing: ScreenAdaper.height(10),
                        //子组件宽高长度比例
                        childAspectRatio: 0.8),
                  ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildGridViewItem(HomeItem item){
    return Container(
      child: GestureDetector(
        child: Column(
          children: [
            Image.network(item.logo,width: ScreenAdaper.width(120),height: ScreenAdaper.height(120),),
            Container(
              margin: EdgeInsets.only(top: ScreenAdaper.height(10)),
              child: Text(item.name,style: TextStyle(color: Colors.black,fontSize: ScreenAdaper.sp(20)),),
            )
          ],
        ),
        onTap: (){
          Navigator.pushNamed(
            context,
            '/homeItemDetail',
            arguments: item, //　传递参数
          );
        },
      ),
    );
  }

}
