import 'package:flutter/material.dart';
import 'package:news_app/constant/api_constant.dart';
import 'package:news_app/constant/color_const.dart';
import 'package:news_app/constant/string_const.dart';
import 'package:news_app/utils/widgethelper/widget_helper.dart';
import 'package:news_app/view/discover/discover.dart';
import 'package:news_app/view/feeds/feed.dart';
import 'package:news_app/view/feeds/news_model.dart';
import 'package:news_app/view/home/home_screen.dart';
import 'package:news_app/view/interest/interest_screen.dart';
import 'package:news_app/view/video/video_screen.dart';

class AllNewsScreen extends StatefulWidget {
  @override
  _AllNewsScreenState createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: getAppBarWithBackBtn(
      //     ctx: context, title: StringConst.HOME_TITLE),
      // bottomNavigationBar: new Material(
      //   color: ColorConst.WHITE_COLOR,
      //   shadowColor: ColorConst.APP_COLOR,
      //   // child: _getTab(),
      // ),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        DiscoverScreen(),
        HomeScreen()

      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
