import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DefaultTabContent extends StatelessWidget {
  final String text;

  DefaultTabContent(text) :
    this.text = text;
  
  @override
  Widget build(BuildContext context) => Tab(
    child: AutoSizeText(
      text,
      maxLines: 1,
      style: TextStyle(
        color: Colors.grey[900]
      ),
    ),
  );
}

class ActivityTitle extends StatelessWidget {
  final String title;

  ActivityTitle(title):
    this.title = title;

  @override
  Widget build(BuildContext context) => Text(
    title,
    style: TextStyle(
      color: Colors.grey[900]
    ),
  );
}

class ListTileTitle extends StatelessWidget {
  final String title;
  final int maxLines;

  ListTileTitle(String title, {int maxLines = 1}):
    this.title = title,
    this.maxLines = maxLines;
  
  @override
  Widget build(BuildContext context) => Text(
    this.title,
    maxLines: this.maxLines,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.0
    ),
  );
}

class ListTileSubtitle extends StatelessWidget {
  final String subtitle;
  final int maxLines;

  ListTileSubtitle(String subtitle, {int maxLines = 1}):
    this.subtitle = subtitle,
    this.maxLines = maxLines;
  
  @override
  Widget build(BuildContext context) => Text(
    this.subtitle,
    maxLines: this.maxLines,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 12.0,
    ),
  );
}

class ListTileContent extends StatelessWidget {
  final String content;
  final int maxLines;

  ListTileContent(String content, {int maxLines = 1}):
    this.content = content,
    this.maxLines = maxLines;
  
  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.only(top: 5.0),
    child: Text(this.content,
      maxLines: this.maxLines,
      overflow: TextOverflow.ellipsis,
    ),
  );
}

class ListTileThumbnail extends StatelessWidget {
  final String imgUrl;

  ListTileThumbnail(String imgUrl):
    this.imgUrl = imgUrl;
  
  @override
  Widget build(BuildContext context) => Container(
    height: 75.0,
    width: 75.0,
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Image.network(this.imgUrl),
    ),
  );
}