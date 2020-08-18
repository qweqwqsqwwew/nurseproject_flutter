import 'package:flutter/material.dart';
import 'package:jh_debug/utils/logData_utls.dart';
import 'package:provider/provider.dart';
import 'provider/counterStore.p.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_request.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/HomeComponents/home_top_service_widget.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/HomeComponents/home_item_widget.dart';
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
  @override
  void initState() {
    super.initState();
    HomeBannerRequest.requestHomeBannerAds().then((res){
      setState(() {
        banner_lists.addAll(res);
      });
    });
    HomeItemsRequest.requestHomeItemsData().then((res){
      setState(() {
        for (HomeItem item in res){
          if (item.is_set == '1'){
            home_set_list.add(item);
          }
        }
        home_items_list.addAll(res);
        LogUtil.d(home_items_list);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    LogUtil.d("------a---------------");
    _counter = Provider.of<CounterStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('首页',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
      ),
        body: _buildListView(context),
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

  Widget _buildListView(BuildContext context){
    return ListView.builder(
      itemCount: _getHomeItemsCount(),
      itemBuilder:(BuildContext context,int index){
        return buildItemsWithHeader(context, index);
      },
    );
  }

  Widget buildItemsWithHeader(BuildContext context,int index){
    if (index < 1){
      return _buildheaderWidget(context, index,home_set_list);
    }else{
         int m = index - 1;
        return _buildHomeItemWidget(context, m, home_items_list[m]);
    }
  }

  Widget _buildHomeItemWidget(BuildContext context,int index,HomeItem homeItem){
    return Container(

      height: 120,
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
    return home_items_list.length + 1;
  }

  Widget _buildheaderWidget(BuildContext context,int index,List home_set_list){
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15),
            child: CarouselSlider(
              options: CarouselOptions(height: 170,autoPlay: true,aspectRatio: 2.0,enlargeCenterPage: true,),
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
            height: 270,
            child: home_top_service_widget(home_set_list),
          ),
        ],
      ),
    );
  }


  Widget _button(String text, {Function onPressed}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: RaisedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 22),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
