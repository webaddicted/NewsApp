import 'package:flutter/material.dart';
import 'package:news_app/constant/api_constant.dart';
import 'package:news_app/constant/color_const.dart';
import 'package:news_app/constant/string_const.dart';
import 'package:news_app/utils/widgethelper/widget_helper.dart';
import 'package:news_app/view/feeds/feed.dart';
import 'package:news_app/view/feeds/news_model.dart';
import 'package:news_app/view/interest/interest_screen.dart';
import 'package:news_app/view/profile/profile_screen.dart';
import 'package:news_app/view/video/video_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  BuildContext ctx;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: getAppBarWithBackBtn(
      //     ctx: context, title: StringConst.HOME_TITLE),
      bottomNavigationBar: new Material(
        color: ColorConst.WHITE_COLOR,
        shadowColor: ColorConst.APP_COLOR,
        child: _getTab(),
      ),
      body: _createUi(context),
    );
  }

  Widget _createUi(BuildContext context) {
    ctx = context;
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        FeedScreen(articalIndex: 0, articals: getArticle(), isFromSearch: true),
        VideoScreen(),
        InterestScreen(),
        ProfileScreen(),
      ],
    );
  }

  TabBar _getTab() {
    return TabBar(
      indicatorColor: ColorConst.APP_COLOR,
      unselectedLabelColor: ColorConst.BLACK_COLOR,
      labelColor: ColorConst.APP_COLOR,
      controller: _tabController,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.home_filled),
          text:  "Home",
        ),
        Tab(
          icon: Icon(Icons.video_collection_outlined),
          text:  "Video",
        ),
        Tab(
          icon: Icon(Icons.content_paste),
          text:  "Artical",
        ),
        Tab(          icon: Icon(Icons.person),
          text:  "Profile",
        ),

      ],
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  getArticle() {
    List<Articles>art=new List();
    Articles articles= new Articles();
    articles.sourceName="authorgfhfhgf";
    articles.author="fghgfgh";
    articles.title="titlefghgfgh";
    articles.description="descriptionfghgfgh";
    articles.url="fghgfgh";
    articles.urlToImage=ApiConstant.DEMO_IMG;
    articles.publishedAt="publishedAtfghgfgh";
    articles.content="contentfghgfgh";

    art.add(articles);
    art.add(articles);
    art.add(articles);
    art.add(articles);
    art.add(articles);
    art.add(articles);
    art.add(articles);
    return art;
  }
}

class FirstPage extends StatelessWidget {
  String title = '';

  FirstPage(this.title);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Center(
        child: getTxtBlackColor(msg: title, fontWeight: FontWeight.bold),
      ),
    );
  }
}
