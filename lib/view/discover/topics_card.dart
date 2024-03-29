import 'package:flutter/material.dart';
import 'package:news_app/constant/assets_const.dart';
import 'package:news_app/constant/color_const.dart';
// import 'package:inshort_clone/controller/feed_controller.dart';
// import 'package:inshort_clone/global/global.dart';
// import 'package:inshort_clone/style/colors.dart';
// import 'package:inshort_clone/style/text_style.dart';

class TopicCard extends StatelessWidget {
  final String icon;
  final String title;
  final Function onTap;

  const TopicCard({Key key, this.icon, this.title, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // FeedController.addCurrentPage(1);
        onTap();
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        height: double.infinity * 0.2,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConst.APP_COLOR,
          ),

          // color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset(
               AssetsConst.LOGO_IMG,
                fit: BoxFit.contain,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  title,
                  // style: AppTextStyle.topiccardTitle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
