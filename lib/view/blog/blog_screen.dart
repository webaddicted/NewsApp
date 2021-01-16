
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constant/assets_const.dart';
import 'package:news_app/utils/widgethelper/widget_helper.dart';

/**
 * Author : Deepak Sharma(Webaddicted)
 * Email : deepaksharmatheboss@gmail.com
 * Profile : https://github.com/webaddicted
 */

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  Widget build(BuildContext context) {
    return _createUi();
  }

  Widget _createUi() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: 25,//dataBean == null ? 0 : dataBean.length,
      itemBuilder: (BuildContext context, int index) {
        return  taskRow(context, "dataBean[index]");
      },
      separatorBuilder: (BuildContext context, int index) {
        return getDivider();
      },
    );
  }


  Widget taskRow(BuildContext context, String taskItem) {
    return  InkWell(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 12.0,
              child: Image.asset(
                AssetsConst.LOGO_IMG,
                fit: BoxFit.cover,
              ),
//              loadImg(ApiConst.DEMO_IMG, 0),
            ),
            new Padding(
              padding: EdgeInsets.fromLTRB(4.0, 0.0, 4.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "item",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Color(0xFFD73C29),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'item.category',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 9.0,
                    ),
                  ),
                  SizedBox(height: 0.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 4.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'RELEASE DATE:',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'item.releaseDate',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'RUNTIME:',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'item.runtime',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
