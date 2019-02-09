import 'package:flutter/material.dart';
import 'newsfeedDetail.dart';
import '../datas/news.dart';

class NewsfeedFragment {  

  static gotoDetail(BuildContext context, String url, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsfeedDetail(url: index.toString()))
    );
  }

  static Widget buildNewsCategory(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => gotoDetail(context, News.news[index]['title'], index),
      child: Container(
        padding: EdgeInsets.all(3.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.orange[200]),
            bottom: BorderSide(width: 1.0, color: Colors.orange[200]),
          ),
          color: Colors.orange[300],
        ),
        child: Text("Category " + index.toString()),
        constraints: BoxConstraints(
          minWidth: 75.0,
          minHeight: 40.0,
        ),
      ),
    );
  }

  static Widget buildNewsCategoryList() {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => buildNewsCategory(context, index),
        scrollDirection: Axis.horizontal,
      ),
      height: 25.0,
      width: double.infinity,
    );
  }

  static Widget buildNews(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => gotoDetail(context, News.news[index]['title'], index),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey)
          ),
        ),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.network(News.news[index]['photo'] + '&x=' + index.toString()),
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(News.news[index]['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(News.news[index]['date_posted'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(News.news[index]['content'],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }

  static Widget buildNewsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: News.news.length,
        itemBuilder: (BuildContext context, int index) => buildNews(context, index),
      ),
    );
  }

  static Widget buildNewsfeedFragment() {
    return Column(
      children: <Widget>[
        buildNewsCategoryList(),
        buildNewsList(),
      ],
    );
  }
}