import 'package:aryakenceng_member/layout/components/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewsCategory extends StatelessWidget {
  final String category;

  NewsCategory(String category):
    this.category = category;
  
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => {},
    child: Container(
      padding: EdgeInsets.all(3.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(width: 2.0, color: Colors.orange[200]),
          bottom: BorderSide(width: 1.0, color: Colors.orange[200]),
        ),
        color: Colors.orange[300],
      ),
      child: Text(category),
      constraints: BoxConstraints(
        minWidth: 100.0,
        minHeight: 50.0,
      ),
    ),
  );
}

class NewsTile extends StatelessWidget {
  final String title, date, imgUrl, content;

  NewsTile(String title, DateTime date, String imgUrl, String content):
    this.title = title,
    this.date = DateFormat('dd/MM/yyyy').format(date),
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
                  ListTileSubtitle(this.date),
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