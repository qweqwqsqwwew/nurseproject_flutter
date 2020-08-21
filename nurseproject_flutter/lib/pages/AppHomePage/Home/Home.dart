import 'package:flutter/material.dart';
import 'package:jh_debug/utils/logData_utls.dart';
import 'package:nurseproject_flutter/utils/util.dart';
import 'package:provider/provider.dart';
import 'provider/counterStore.p.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_request.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/HomeComponents/home_top_service_widget.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/HomeComponents/home_item_widget.dart';
import 'package:nurseproject_flutter/provider/appCommenNetData.dart';
class Home extends StatefulWidget {
  Home({Key key, this.params}) : super(key: key);
  final params;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  CounterStore _counter;
  final List<BannerItem> banner_lists = [];
  final List<HomeItem> home_items_list = [];
  final List<HomeItem> home_set_list = [];

  ///下拉刷新
  ScrollController _scrollController;
  bool isLoading = false;

  ServiceItemList _serviceItemListProvider;
  @override
  void initState() {
    super.initState();
    HomeBannerRequest.requestHomeBannerAds().then((res){
      setState(() {
        banner_lists.addAll(res);
      });
    });

    ///初始化下拉加载
    _scrollController = ScrollController();
    // 监听ListView是否滚动到底部
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        // 滑动到了底部
        print('滑动到了底部');
        // 这里可以执行上拉加载逻辑
//        _loadMore();
      }
    });
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    LogUtil.d("------a---------------");
    _counter = Provider.of<CounterStore>(context);
    _serviceItemListProvider = Provider.of<ServiceItemList>(context);
    if(_serviceItemListProvider.getserviceList.length == 0){
      _serviceItemListProvider.getServiceItemsList();
    }else{
     List<HomeItem> m = _serviceItemListProvider.getserviceList;
     for (HomeItem obj in m) {
       if (obj.is_set == '1'){
            home_set_list.add(obj);
          }
     }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('首页',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
      ),
        body: Container(
          child: RefreshIndicator(
            child: _buildListView(context),
            onRefresh: _handleRefresh,
          ),
        ),
//        _buildListView(context),
      floatingActionButton: FloatingActionButton(
        heroTag: 'homeBtn1',
        onPressed: () async {
          _counter.increment();
        },
        tooltip: '加加store值',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<Null> _handleRefresh() async {
    _serviceItemListProvider.getServiceItemsList();
    ToasrShow.show('加载成功');
  }

  Widget _buildListView(BuildContext context){
    return Consumer<ServiceItemList>(
      builder: (_, a, child) =>
            ListView.builder(
              itemCount: _getHomeItemsCount(),
              itemBuilder:(BuildContext context,int index){
                return buildItemsWithHeader(context, index);
              },
      ),
    );
  }

  Widget buildItemsWithHeader(BuildContext context,int index){
    if (index < 1){
      return _buildheaderWidget(context, index,_serviceItemListProvider.getserviceList);
    }else{
         int m = index - 1;
        return _buildHomeItemWidget(context, m, _serviceItemListProvider.getserviceList[m]);
    }
  }

  Widget _buildHomeItemWidget(BuildContext context,int index,HomeItem homeItem){
    return Container(

      height: ScreenAdaper.height(220),
        child: GestureDetector(
          child: home_item_widget(homeItem),
          onTap: (){
            Navigator.pushNamed(
              context,
              '/homeItemDetail',
              arguments: homeItem, //　传递参数
            );
          },
        ),
    );
  }

  int _getHomeItemsCount(){
    return _serviceItemListProvider.getserviceList.length + 1;
  }

  Widget _buildheaderWidget(BuildContext context,int index,List home_set_list){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15,left: 15,right:15),
            child: CarouselSlider(
              options: CarouselOptions(height: ScreenAdaper.height(200),autoPlay: true,aspectRatio: 2,enlargeCenterPage: true,autoPlayInterval:Duration(seconds: 2)),
              items: banner_lists.map((item) => Container(
                child: Center(
//                      child: Image.network(item.img, fit: BoxFit.fill, width: MediaQuery.of(context).size.width,height:200)
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(item.img),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                ),
              )).toList(),
            ),
          ),
          Container(
            height: ScreenAdaper.height(430),
            child: home_top_service_widget(home_set_list),
          ),
        ],
      ),
    );
  }
}
