import 'package:flutter/material.dart';

class NewsfeedDetail extends StatelessWidget {
  final String url;
  
  NewsfeedDetail({Key key, @required this.url}) : super(key: key);

  static Widget buildNewsfeedBody(String url) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          Container(  //Title
            child: Text(url * 8,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          Container(  //Title
            child: Text("Diterbitkan pada " + url,
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            decoration: BoxDecoration(
              color: Colors.indigo
            ),
            width: double.infinity,
            child: Image.network("https://animatedanatomy.com/images/16-9-dummy-image6.jpg"),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text((("#" * 350) + " ") * 5),
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
