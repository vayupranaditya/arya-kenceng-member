import 'package:flutter/material.dart';
import '../datas/news.dart';

class NewsfeedDetail extends StatelessWidget {
  final String url;
  
  NewsfeedDetail({Key key, @required this.url}) : super(key: key);

  static Widget buildNewsfeedBody(String url) {
    return Container(
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0), //Title
            child: Text(News.news[int.parse(url)]['title'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Container(  //Title
            margin: EdgeInsets.only(top:4.0, left: 10.0, right: 10.0), //Title
            child: Text("Diterbitkan pada " + News.news[int.parse(url)]['date_posted'] + " oleh " + News.news[int.parse(url)]['author'],
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.indigo
            ),
            width: double.infinity,
            child: Image.network(News.news[int.parse(url)]['photo_large'] + '&x=' + url),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0, bottom: 10.0, left: 10.0),
            child: Text(News.news[int.parse(url)]['content']),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kabar"),
        backgroundColor: Colors.orange[400],
      ),
      body: buildNewsfeedBody(url)
    );
  }
}
