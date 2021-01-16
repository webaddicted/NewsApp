import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constant/api_constant.dart';
import 'package:news_app/constant/color_const.dart';
import 'package:news_app/constant/string_const.dart';
import 'package:news_app/utils/widgethelper/widget_helper.dart';

/**
 * Author : Deepak Sharma(Webaddicted)
 * Email : deepaksharmatheboss@gmail.com
 * Profile : https://github.com/webaddicted
 */

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return _createUi();
  }
  Widget _createUi() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 25, //dataBean == null ? 0 : dataBean.length,
      itemBuilder: (BuildContext context, int index) {
        return taskRow(context, "dataBean[index]");
      },
      separatorBuilder: (BuildContext context, int index) {
        return getDivider();
      },
    );
  }

  Widget taskRow(BuildContext context, String taskItem) {
    return InkWell(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => GridItemDetails(this.item),
//          ),
//        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                ApiConstant.DEMO_IMG,
                fit: BoxFit.fill,
              ),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 8.0, 4.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getTxtBlackColor(
                        msg:"25 January 2020",
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        fontSize: 15.0,
                        // color: Color(0xFFD73C29),
                        fontWeight: FontWeight.bold,
                      ),
                      getTxtBlackColor(
                        msg: '11:00 AM to 15:00 PM',
                        fontSize: 12.0,
                      ),
                    ],
                  ),
                  Center(
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.black,
                          ),
                          // borderRadius: BorderRadius.circular(radius),
                          // color: Colors.black,
                          child: Padding(
                            padding:  EdgeInsets.only(left: 8,right: 8, top: 5, bottom: 5),
                            child: getTxtWhiteColor(msg: "Upcoming"),
                          )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
