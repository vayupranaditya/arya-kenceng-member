import 'package:flutter/material.dart';

class MemberDetail extends StatelessWidget {
  final String url;
  
  MemberDetail({Key key, @required this.url}) : super(key: key);

  static Widget buildProfileSummary() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.orange[300],
      ),
      padding: EdgeInsets.only(top: 25.0, bottom: 10.0),
      alignment: Alignment(0.0,0.0),
      child: Column(
        children: <Widget>[
          Container(
            child: CircleAvatar(
              backgroundColor: Colors.indigo,
              minRadius: 50.0,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Nama Lengkap Nama Lengkap",
                  textScaleFactor: 1.2,
                  maxLines: 1,
                ),
              ],
            )
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Jro Titih",
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

  static Widget buildProfileDetail() {
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
                  value: "03/18/1999"
                ),
                buildField(
                  name: "Jenis kelamin",
                  value: "Laki-laki"
                ),
                buildField(
                  name: "Status",
                  value: "Single"
                ),
                buildField(
                  name: "Alamat tinggal",
                  value: "HeyMart, Banjar Teges, Desa Beraban, Kecamatan Selemadeg Timur, Kabupaten Tabanan, Bali",
                  isMultiline: true,
                ),
                buildField(
                  name: "Nomor telepon",
                  value: "081236629835"
                ),
                buildField(
                  name: "Pekerjaan",
                  value: "Mahasiswa"
                ),
                buildField(
                  name: "Bidang usaha",
                  value: "Pendidikan"
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget buildProfileBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            children: <Widget>[
              buildProfileSummary(),
              buildProfileDetail(),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anggota"),
        backgroundColor: Colors.orange[400],
      ),
      body: buildProfileBody()
    );
  }
}
