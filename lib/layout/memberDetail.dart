import 'package:flutter/material.dart';
import '../datas/users.dart';

class MemberDetail extends StatelessWidget {
  final String url;

  MemberDetail({Key key, @required this.url}) : super(key: key);

  static Widget buildProfileSummary(Map <String, String> user) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange[300],
      ),
      padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
      alignment: Alignment(0.0,0.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(user['profilePicture'],
              width: 100.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:10.0),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Text(user['name'],
                    textAlign: TextAlign.center,
                    textScaleFactor: 1.3,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ],
            )
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(user['jroPuri'],
                  maxLines: 1,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget buildValue({@required String value, bool isMultiline = false}) {
    if (isMultiline) {
      return Expanded(
        child: Text(value,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15.0,
            color: Colors.grey
          ),
        ),
      );
    } else {
      return Container(
        child: Text(value,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 15.0,
            color: Colors.grey
          ),
        ),
      );
    }
  }

  static Widget buildField({@required String name, String type, String url, @required String value, bool isMultiline = false}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(name,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              buildValue(
                value: value,
                isMultiline: isMultiline
              )
            ],
          )
        ],
      ),
    );
  }

  static Widget buildProfileDetail(Map <String, String> user) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildField(
                  name: "Tanggal lahir",
                  value: user['birthdate']
                ),
                buildField(
                  name: "Jenis kelamin",
                  value: user['gender']
                ),
                buildField(
                  name: "Status",
                  value: user['status']
                ),
                buildField(
                  name: "Alamat tinggal",
                  value: user['address'],
                  isMultiline: true,
                ),
                buildField(
                  name: "Nomor telepon",
                  value: user['phone']
                ),
                buildField(
                  name: "Pekerjaan",
                  value: user['job']
                ),
                buildField(
                  name: "Bidang usaha",
                  value: user['business']
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget buildProfileBody(Map <String, String> user) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              buildProfileSummary(user),
              buildProfileDetail(user),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Map <String, String> user = UserDetail.getUser(url);
    return Scaffold(
      appBar: AppBar(
        title: Text("Anggota"),
        backgroundColor: Colors.orange[400],
      ),
      body: buildProfileBody(user)
    );
  }
}
