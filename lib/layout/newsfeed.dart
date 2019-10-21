import 'package:aryakenceng_member/layout/components/newsfeed/global.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'newsfeedDetail.dart';
import '../datas/news.dart';

class NewsfeedFragment extends StatelessWidget{

  final List<Map<String, String>> news = News.news;

  void _gotoDetail(BuildContext context, String url, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewsfeedDetail(url: index.toString()))
    );
  }

  Widget buildNewsCategoryList() {
    return Container(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => NewsCategory('category_' + index.toString()),
        scrollDirection: Axis.horizontal,
      ),
      height: 25.0,
      width: double.infinity,
    );
  }

  Widget buildNewsList(List<Map<String, String>> news) {
    return Expanded(
      child: ListView.builder(
        itemCount: News.news.length,
        itemBuilder: (BuildContext context, int index) => NewsTile(
          news[index]['title'],
          DateFormat('dd/MM/yyyy').parse(news[index]['date_posted']),
          news[index]['photo'],
          news[index]['content']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      buildNewsCategoryList(),
      buildNewsList(news),
    ],
  );
}