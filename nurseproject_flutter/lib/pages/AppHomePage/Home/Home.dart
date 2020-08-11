import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/counterStore.p.dart';
import 'package:nurseproject_flutter/thirdparty/carousel.dart';
import 'package:nurseproject_flutter/services/api.dart';
import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/utils/log_util.dart' show PermUtils, SpUtil;

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

  @override
  void initState() {
    super.initState();
    getBannerData();
  }

  void getBannerData() async{
    try {
      Map resData = await getHomeBannerData();
      LogUtil.d(resData);
    }catch(e){
      LogUtil.d('---------');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _counter = Provider.of<CounterStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('首页',style: TextStyle(color: Colors.white),),
        automaticallyImplyLeading: false,
      ),
      body: contextWidget(),
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

  Widget contextWidget() {
    return ListView(
      children: List.generate(1, (index) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Carousel(carouselList: carouselList, tagWidth: 414.0),
              _button(
                '点我去test页',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/testDemo',
                    arguments: {'data': '别名路由传参666'},
                  );
                },
              ),
              Consumer<CounterStore>(
                builder: (_, counterStore, child) {
                  return Text('状态管理值：${counterStore.value}');
                },
              ),
            ],
          ),
        );
      }),
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


// mock 轮播列表
List carouselList = <Widget>[
  Container(
      color: Colors.deepOrange, child: Center(child: Text('111'))
  ),
  Container(
      color: Colors.amberAccent, child: Center(child: Text('222'))
  ),
  Container(
      color: Colors.pink, child: Center(child: Text('333'))
  )
];