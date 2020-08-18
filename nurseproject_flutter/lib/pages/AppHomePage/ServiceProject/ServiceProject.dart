import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';

import '../../../utils/util.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nurseproject_flutter/provider/appCommenNetData.dart';
class ServiceProject extends StatefulWidget {

  ServiceProject({Key key, this.params}) : super(key: key);
  final params;
  
  @override
  _ServiceProjectState createState() => _ServiceProjectState();
}

class _ServiceProjectState extends State<ServiceProject>  with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;
  ServiceItemList _serviceItemListProvider;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    LogUtil.d(widget.params);
  }


  @override
  Widget build(BuildContext context) {
    _serviceItemListProvider = Provider.of<ServiceItemList>(context);
    if(_serviceItemListProvider.getserviceList.length == 0){
      _serviceItemListProvider.getServiceItemsList();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('服务项目',style: TextStyle(color: Colors.white),),
          automaticallyImplyLeading:false
      ),
      body: ListView(
        children: List.generate(1, (index) {
          return Container(
            child:Consumer<ServiceItemList>(
                              builder: (_, a, child) => Text(
                                '状态共享值：${_serviceItemListProvider.getserviceList.length == 0?'wwwww':_serviceItemListProvider.getserviceList[0].name}',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
          );
        }),
      ),
    );
  }

  Widget _setupServicePage(BuildContext context){
    return Container(
      child: Row(
        children: [

        ],
      ),
    );
  }
}
