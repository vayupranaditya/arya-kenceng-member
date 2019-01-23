import 'package:flutter/material.dart';

class NewsfeedFragment {

  static List <List <String>> news = [
    ["Judul", "Tanggal", "Isi berita"],
    ["Judul", "Tanggal", "Isi berita"],
    ["Judul", "Tanggal", "Isi berita"],
    ["Judul", "Tanggal", "Isi berita"],
    ["Judul", "Tanggal", "Isi berita"],
    ["Judul", "Tanggal", "Isi berita"],
    ["Judul", "Tanggal", "Isi berita"],
    ["Judul", "Tanggal", "Isi berita"],
  ];

  static Widget buildNewsCategory(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => print("news category: " + index.toString() + " clicked"),
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
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index) => buildNewsCategory(context, index),
        scrollDirection: Axis.horizontal,
      ),
      height: 25.0,
      width: double.infinity,
    );
  }

  static Widget buildNews(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => print("news " + index.toString() + " clicked"),
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
                    color: Colors.indigo,
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
                    Text(news[index][0] + " " + index.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                      ),
                    ),
                    Text(news[index][1],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text((news[index][2] + " ") * 10,
                        maxLines: 2,
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
        itemCount: news.length,
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