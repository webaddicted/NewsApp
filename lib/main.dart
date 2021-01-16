import 'package:flutter/material.dart';
import 'package:news_app/constant/assets_const.dart';
import 'package:news_app/constant/color_const.dart';
import 'package:news_app/constant/string_const.dart';
import 'package:news_app/view/home/home_screen.dart';
import 'package:news_app/view/scope_model_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return getView();
  }

  Widget getView() {
    return MaterialApp(
      title: StringConst.APP_NAME,
      debugShowCheckedModeBanner: false,
     // darkTheme: ThemeData.dark(),
      theme: ThemeData(
        fontFamily: AssetsConst.ZILLASLAB_FONT,
        accentColor: ColorConst.APP_COLOR,
        accentColorBrightness: Brightness.light,
        primarySwatch: ColorConst.APP_COLOR,
      ),
      home: HomeScreen(),
    );
  }
}
