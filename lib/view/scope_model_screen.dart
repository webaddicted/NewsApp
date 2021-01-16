import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:news_app/constant/color_const.dart';
import 'package:news_app/data/bean/now_playing_respo.dart';
import 'package:news_app/model/movie_model.dart';
import 'package:news_app/utils/apiutils/api_response.dart';
import 'package:news_app/utils/widgethelper/widget_helper.dart';
import 'package:news_app/view/discover/discover.dart';
import 'package:news_app/view/feeds/feed.dart';
import 'package:news_app/view/feeds/news_model.dart';
import 'package:news_app/view/widget/row_movies_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopeModelScreen extends StatefulWidget {
  ScopeModelScreen();
  @override
  _ScopeModelScreenState createState() =>
      _ScopeModelScreenState();
}

class _ScopeModelScreenState extends State<ScopeModelScreen> {
  _ScopeModelScreenState();

  String castCrewTitle;
  MovieScopeModel model;
  ScrollController _scrollController = new ScrollController();
  int total_pages = 1;
  int pageSize = 1;
  List<Result> dataResult = new List();

  @override
  void initState() {
    super.initState();
    model = MovieScopeModel();
    model.trandingMovie(pageSize);
    _scrollController.addListener(() {
      // debugPrint(
      //     "pixels : ${_scrollController.position
      //         .pixels}  \n maxScrollExtent : ${_scrollController.position
      //         .maxScrollExtent}");
      if (_scrollController.position.pixels > 0 &&
          _scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent) {
        if (pageSize <= total_pages) model.trandingMovie(pageSize);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var homeIcon = IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorConst.BLACK_COLOR,
        ),
        onPressed: () => SystemNavigator.pop());
    var nextScreen = IconButton(
        icon: Icon(
          Icons.local_parking_rounded,
          color: ColorConst.BLACK_COLOR,
        ),
        onPressed: () {
          List<Articles>art=new List();
          Articles articles= new Articles();
          articles.sourceName="authorgfhfhgf";
          articles.author="fghgfgh";
          articles.title="titlefghgfgh";
          articles.description="descriptionfghgfgh";
          articles.url="fghgfgh";
          articles.urlToImage="urlToImagefghgfgh";
          articles.publishedAt="publishedAtfghgfgh";
          articles.content="contentfghgfgh";

          art.add(articles);
          art.add(articles);
          art.add(articles);
          art.add(articles);
          art.add(articles);
          art.add(articles);
          art.add(articles);

          navigationPush(context, FeedScreen(articalIndex: 0, articals: art,isFromSearch: true,));
        });
    return WillPopScope(
        onWillPop: () {
          return onWillPop(context);
        },
        child: Scaffold(
            appBar: getAppBarWithBackBtn(
                ctx: context,
                title: 'Trending Movie',
                bgColor: Colors.white,
                icon: homeIcon,
                actions: [nextScreen]),
            body: OrientationBuilder(
                builder: (context, orientation) => ScopedModel(
                    model: model, child: apiresponse(orientation)))));
  }

  Widget apiresponse(Orientation orientation) {
    return ScopedModelDescendant<MovieScopeModel>(
      builder: (context, _, model) {
        var jsonResult = model.getTrandingMovie;
        if (jsonResult.status == ApiStatus.COMPLETED) {
          return _createUi(jsonResult.data, orientation);
        } else
          return apiHandler(
              loading: RowMoviesScreen(
                isShowShimmer: true,
              ),
              response: jsonResult);
      },
    );
  }

  Widget _createUi(data, Orientation orientation) {
    if (data is NowPlayingRespo) {
      pageSize++;
      total_pages = data.total_pages;
      dataResult.addAll(data.results);
    }
    int columnCount = orientation == Orientation.portrait
        ? data is NowPlayingRespo
            ? 2
            : 3
        : data is NowPlayingRespo
            ? 4
            : 4;
    return Container(
      alignment: Alignment.center,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: columnCount,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        staggeredTileBuilder: (int index) =>
            StaggeredTile.extent(1, data is NowPlayingRespo ? 290 : 128),
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        itemCount: dataResult.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: getItemView(dataResult[index], index),
        ),
      ),
    );
  }

  Widget getItemView(Result item, int index) {
    return RowMoviesScreen(
        context: context,
        index: index,
        height: 240,
        width: 135,
        id: item.id,
        img: item.poster_path,
        name: item.original_title,
        vote: item.vote_average,
        isShowShimmer: false,
        onTap: () {});
  }
}

Future<bool> onWillPop(BuildContext context) async {
  return showDialog<bool>(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: getTxtColor(
              msg: "Are you sure you want to exit this app?",
              fontSize: 17,
              txtColor: ColorConst.GREY_800),
          title: getTxtBlackColor(
              msg: "Warning!", fontSize: 18, fontWeight: FontWeight.bold),
          actions: <Widget>[
            FlatButton(
                child: getTxtBlackColor(
                  msg: "Yes",
                  fontSize: 17,
                ),
                onPressed: () => SystemNavigator.pop()),
            FlatButton(
                child: getTxtBlackColor(
                  msg: "No",
                  fontSize: 17,
                ),
                onPressed: () => Navigator.pop(context)),
          ],
        );
      });
}
