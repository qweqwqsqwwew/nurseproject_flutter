import 'package:flutter/material.dart';
import 'dart:collection';
import '../../../../utils/util.dart';
import 'package:flutter_custom_calendar/flutter_custom_calendar.dart';
import '../../MyPersonal/RelatedObject_request/DottedLineWidget.dart';
class HomeServiceTimeSelect extends StatefulWidget {
  HomeServiceTimeSelect({Key key, this.params}) : super(key: key);
  final  params;
  @override
  _HomeServiceTimeSelectState createState() => _HomeServiceTimeSelectState();
}

class _HomeServiceTimeSelectState extends State<HomeServiceTimeSelect> {
  CalendarController controller;
  CalendarViewWidget calendar;
  String _selectDate = '';
  HashSet<DateTime> _selectedDate = new HashSet();
  HashSet<DateModel> _selectedModels = new HashSet();
  bool _isMonthSelected = false;
  String _select_data_string = '';
  List _workingTimeList = ['08:00','09:00','10:00','11:00','12:00','13:00','14:00','15:00','16:00','17:00'];
  List _selectTwoDataList = [];

  GlobalKey<CalendarContainerState> _globalKey = new GlobalKey();
  @override
  void initState() {
    // TODO: implement initState
    _selectedDate.add(DateTime.now());
    controller = new CalendarController(
        minYear: 2019,
        minYearMonth: 1,
        maxYear: 2024,
        maxYearMonth: 12,
        showMode: CalendarConstants.MODE_SHOW_WEEK_AND_MONTH,
        selectedDateTimeList: _selectedDate,
        selectMode: CalendarSelectedMode.singleSelect)
      ..addOnCalendarSelectListener((dateModel) {
        _selectedModels.add(dateModel);
        LogUtil.d('-------3--------${_selectedModels.toString()}');
        LogUtil.d('-------4--------${dateModel.toString()}');
        _select_data_string = '${dateModel.year}-${dateModel.month}-${dateModel.day}';
        setState(() {
          _selectDate = _selectedModels.toString();
        });
      })
      ..addOnCalendarUnSelectListener((dateModel) {
        LogUtil.d('-------1--------${_selectedModels.toString()}');
        LogUtil.d('-------2--------${dateModel.toString()}');
        if (_selectedModels.contains(dateModel)) {
          _selectedModels.remove(dateModel);
        }
        setState(() {
          _selectDate = '';
        });
      });
    calendar = new CalendarViewWidget(
      key: _globalKey,
      calendarController: controller,
      dayWidgetBuilder: (DateModel model) {
        double wd = (MediaQuery.of(context).size.width - 20) / 7;
        bool _isSelected = model.isSelected;
        if (_isSelected &&
            CalendarSelectedMode.singleSelect ==
                controller.calendarConfiguration.selectMode) {
          _selectDate = model.toString();
        }
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(wd / 2)),
          child: Container(
            color: _isSelected ? Colors.orange : Colors.white,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  model.day.toString(),
                  style: TextStyle(
                      color: model.isCurrentMonth
                          ? (_isSelected == false
                          ? (model.isWeekend
                          ? Colors.black38
                          : Colors.black87)
                          : Colors.white)
                          : Colors.black38),
                ),
//              Text(model.lunarDay.toString()),
              ],
            ),
          ),
        );
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择日期'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
//        alignment: Alignment.topCenter,
              child: calendar,
            ),
            DottedLineWidget(axis: Axis.horizontal,
              width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
              height: 10.0,
              lineHeight: 0.5,
              lineWidth: 3,
              count: 40,
              color: Colors.black45,),
            Container(
              alignment: Alignment.topCenter,
              child: Text(_select_data_string,style: TextStyle(color: Colors.orange),),
            ),
            DottedLineWidget(axis: Axis.horizontal,
              width: ScreenAdaper.screenWidth() - ScreenAdaper.width(70),
              height: 10.0,
              lineHeight: 0.5,
              lineWidth: 3,
              count: 40,
              color: Colors.black45,),
            Container(
              padding: EdgeInsets.only(left: ScreenAdaper.width(35),right: ScreenAdaper.width(35),top: ScreenAdaper.height(40)),
              width: ScreenAdaper.screenWidth(),
              height: ScreenAdaper.height(600),
              child: GridView.builder(
                physics: new NeverScrollableScrollPhysics(),
                itemCount: _workingTimeList.length,
                itemBuilder: (BuildContext context, int index) {
                  //Widget Function(BuildContext context, int index)
                  return _buildGridViewItem(context,index);
                },
                //SliverGridDelegateWithFixedCrossAxisCount 构建一个横轴固定数量Widget
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //横轴元素个数
                    crossAxisCount: 4,
                    //纵轴间距
                    mainAxisSpacing: ScreenAdaper.width(35),
                    //横轴间距
                    crossAxisSpacing: ScreenAdaper.height(35),
                    //子组件宽高长度比例
                    childAspectRatio: 1),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text('已选择日期，需要选择两次服务时间',style: TextStyle(color: Colors.orange,fontSize: ScreenAdaper.sp(27)),),
            ),
            Container(
              width: ScreenAdaper.screenWidth(),
              height: ScreenAdaper.height(100),
              child: ListView.builder(
                  scrollDirection:Axis.horizontal,
                  itemCount: _selectTwoDataList.length,
                  itemBuilder: (ctx, index) {
                    return _buildSelectData(index);
                  })
            ),
            GestureDetector(
              child: new ClipRRect(
                borderRadius: BorderRadius.circular(ScreenAdaper.width(35)),
                child: Container(
                  width: ScreenAdaper.screenWidth() - ScreenAdaper.width(100),
                  color: Colors.orange,
                  height: ScreenAdaper.height(80),
                  alignment: Alignment.center,
                  child:Text('确定',style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(35),),textAlign: TextAlign.center,),
                ),
              ),
              onTap: (){
                Navigator.maybePop(context);
              },
            ),
          ],
        ),
      )
    );
  }

  Widget _buildSelectData(int index){
    return Container(
      child: OutlineButton(
        color: Colors.orange,
        onPressed: (){
          
        },
        child: Text(_selectTwoDataList[index],style: TextStyle(color: Colors.white,fontSize: ScreenAdaper.sp(25)),),
      ),
    );
  }

  Widget _buildGridViewItem(BuildContext context,int index){
    return Container(
      child: RaisedButton(
        shape: CircleBorder(),
//        color: _relationObjectListProvider.getSelectRelationModel == null?Colors.white:_relationObjectListProvider.getSelectRelationModel.id==item.id?Colors.orange:Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_workingTimeList[index],style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(25))),
            SizedBox(height: ScreenAdaper.height(6),),
            Text('可预约',style: TextStyle(color: Colors.black54,fontSize: ScreenAdaper.sp(20))),
          ],
        ),
        onPressed: (){
          LogUtil.d("点击了");
        },
      ),
    );
  }
}
