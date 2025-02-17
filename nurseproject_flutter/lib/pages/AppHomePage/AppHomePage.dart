import 'package:ana_page_loop/ana_page_loop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jh_debug/jh_debug.dart';
import 'package:nurseproject_flutter/ioc/locator.dart';
import 'package:provider/provider.dart';
import '../../components/UpdateAppVersion/UpdateAppVersion.dart'
    show getNewAppVer;
import '../../config/app_config.dart';
import '../../components/DoubleBackExitApp/DoubleBackExitApp.dart';
import 'Search/Search.dart';
import 'Home/Home.dart';
import 'provider/appHomePageStore.p.dart';
import 'Changhuxian/Changhuxian.dart';
import 'ServiceProject/ServiceProject.dart';
import 'MyPersonal/Mine.dart';
import 'package:url_launcher/url_launcher.dart';

/// [params] 别名路由传递的参数
/// [params.pageId] 跳转到指定tab页面（0第一页），如果不是别名路由跳转的话，又想实现跳转到指定tab页面，推荐别名路由跳转方式。
///```dart
/// // 手动传入参数跳转路由方式如下：
/// Navigator.of(context).push(
///   MaterialPageRoute(
///     builder: (context) => BarTabs(
///       params: {'pageId': 2}, // 跳转到tabs的第三个页面
///     ),
///   )
/// );
///
/// // 别名路由跳转方式如下：
/// Navigator.pushNamed(context, '/testDemo', arguments: {
///   'pageId': 2,
/// });
/// ```
class AppHomePage extends StatefulWidget {
  final params;

  AppHomePage({
    Key key,
    this.params,
  }) : super(key: key);

  @override
  _AppHomePageState createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> with PageViewListenerMixin {
  int currentIndex = 0; // 接收bar当前点击索引
  bool physicsFlag = false; // 是否禁止滑动跳转页面
  AppHomePageStore appPageStore;
  PageController pageController;

  // 导航菜单渲染数据源
  static List<Map<String, dynamic>> barData = [
    {
      'title': '首页',
      'icon': Icons.home,
      'body': Home(),
    },
    {
      'title': '长护险',
      'icon': Icons.weekend,
      'body': Changhuxian(),
    },
    {
      'title': '服务项目',
      'icon': Icons.whatshot,
      'body': ServiceProject(),
    },
    {
      'title': '一键呼叫',
      'icon': Icons.search,
      'body': Search(),
    },
    {
      'title': '个人中心',
      'icon': Icons.person,
      'body': Mine(),
    },
  ];

  // 导航菜单渲染数据源
  static List<Map<String, dynamic>> barPageData = [
    {
      'title': '首页',
      'icon': Icons.home,
      'body': Home(),
    },
    {
      'title': '长护险',
      'icon': Icons.weekend,
      'body': Changhuxian(),
    },
    {
      'title': '服务项目',
      'icon': Icons.whatshot,
      'body': ServiceProject(),
    },
//    {
//      'title': '一键呼叫',
//      'icon': Icons.search,
//      'body': Search(),
//    },
    {
      'title': '个人中心',
      'icon': Icons.person,
      'body': Mine(),
    },
  ];

  @override
  void initState() {
    super.initState();
    handleCurrentIndex();
    initTools();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      appPageStore.saveController(pageController);

      if (AppConfig.showJhDebugBtn) {
        jhDebug.showDebugBtn(); // jhDebug 调试按钮
      }

      getNewAppVer(); // 更新APP版本检查
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// 处理tab默认显示索引
  handleCurrentIndex() {
    if (widget.params != null) {
      // 默认加载页面
      currentIndex = widget.params['pageId'] ?? 0 >= (barData.length)
          ? (barData.length - 1)
          : widget.params['pageId'];
    }

    // 初始化tab控制器
    pageController = PageController(initialPage: currentIndex, keepPage: true);
  }

  /// 初始化第三方插件插件
  initTools() {
    // jhDebug插件初始化
    jhDebug.init(
      context: context,
      // 调试窗口按钮1事件
      btnTap1: () {},
    );
  }

  /// 实现PageViewListenerMixin类上的方法，供页面埋点使用
  @override
  PageViewMixinData initPageViewListener() {
    return PageViewMixinData(
      controller: pageController,
      tabsData: barData.map((data) => data['title'] as String).toList(),
    );
  }

  @override
  void didPopNext() {
    super.didPopNext();
  }

  @override
  void didPop() {
    super.didPop();
  }

  @override
  void didPush() {
    super.didPush();
  }

  @override
  void didPushNext() {
    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    // 初始化设计稿尺寸
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    appPageStore = Provider.of<AppHomePageStore>(context);

    return ColorFiltered(
      colorFilter: ColorFilter.mode(
        appPageStore.getGrayTheme ? Color(0xff757575) : Colors.transparent,
        BlendMode.color,
      ),
      child: _scaffoldBody(),
    );
  }

  /// 页面Scaffold层组件
  Widget _scaffoldBody() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          PageView(
            controller: pageController,
            physics: physicsFlag ? NeverScrollableScrollPhysics() : null,
            children: bodyWidget(), // tab页面主体
            // 监听滑动
            onPageChanged: (index) {
              if (index ==3){
                index = index + 1;
                setState(() {
                  currentIndex = index;
                });
              }else{
                setState(() {
                  currentIndex = index;
                });
              }
            },
          ),
          Positioned(
            bottom: 30,
            child: DoubleBackExitApp(),
          ),
        ],
      ),

      // 底部栏
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex, // 当前页
        elevation: 5.0,
        selectedFontSize: 26.sp, // 选中的字体大小
        unselectedFontSize: 26.sp, // 未选中的字体大小
        onTap: (int idx) async {
          if(idx == 3){
            showAlertDialog(context);
          }else{
            currentIndex = idx;
            setState(() {
              currentIndex = idx;
            });
            if(idx == 4){
              pageController.jumpToPage(idx-1); // 跳转
            }else{
              pageController.jumpToPage(idx); // 跳转
            }
          }
        },
        items: _generateBottomBars(), // 底部菜单导航
      ),
    );
  }

  void showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text('拨打电话：0512-66568030'),
            title: Center(
                child: Text(
                  '联系客服',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchPhone();
                  },
                  child: Text('确定')),
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消')),
            ],
          );
        });
  }

  _launchPhone() async {
    const url = 'tel:0512-66568030';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// tab视图内容区域
  List<Widget> bodyWidget() {
    try {
      return barPageData.map((itemData) => itemData['body'] as Widget).toList();
    } catch (e) {
      throw Exception('barData导航菜单数据缺少body参数，errorMsg:$e');
    }
  }

  /// 生成底部菜单导航
  List<BottomNavigationBarItem> _generateBottomBars() {
    try {
      return barData.map<BottomNavigationBarItem>((itemData) {
        return BottomNavigationBarItem(
          icon: Icon(
            itemData['icon'], // 图标
            size: 44.sp,
          ),
          title: Text(itemData['title']),
        );
      }).toList();
    } catch (e) {
      throw Exception(
          'barData数据缺少title参数（String类型）、或icon参数（IconData类型）, errorMsg:$e');
    }
  }
}
