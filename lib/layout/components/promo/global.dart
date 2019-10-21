import 'package:flutter/material.dart';
import '../global.dart';

class PromoTile extends StatelessWidget {
  final String title, status, imgUrl, content;

  PromoTile(String title, String status, String imgUrl, String content):
    this.title = title,
    this.status = status,
    this.imgUrl = imgUrl,
    this.content = content;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => {},
    child: Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey)
        ),
      ),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              ListTileThumbnail(this.imgUrl)
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ListTileTitle(this.title, maxLines: 2),
                  ListTileSubtitle(this.status),
                  ListTileContent(this.content, maxLines: 2,)
                ],
              ),
            )
          )
        ],
      ),
    )
  );
}