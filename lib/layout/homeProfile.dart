import 'package:flutter/material.dart';

class ProfileFragment {

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
            width: 100.0,
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.indigo,
                  backgroundImage: NetworkImage("https://media.licdn.com/dms/image/C5603AQE34nhJoXmUfg/profile-displayphoto-shrink_200_200/0?e=1554940800&v=beta&t=gw7pkmo2OKaZwOyHO0PBKz7kJblnc3jOJqqRRQ7Wvz4"),
                  minRadius: 50.0,
                ),
                Positioned(
                  right: 0.0,
                  bottom: 0.0,
                  width: 40.0,
                  height: 40.0,
                  child: FloatingActionButton(
                    onPressed: () => {},
                    backgroundColor: Colors.orange,
                    child: Icon(Icons.edit),
                  ),
                )
              ],
            )
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text("I Gusti Bagus Vayupranaditya Putraadinatha",
                        textScaleFactor: 1.2,
                        textAlign: TextAlign.center,
                      )
                    ),
                    SizedBox(
                      height: 25.0,
                      width: 25.0,
                      child: IconButton(
                        padding: EdgeInsets.all(0.0),
                        icon: Icon(Icons.edit),
                        iconSize: 20.0,
                        onPressed: () => {},
                      ),
                    ),
                  ]
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Jro Titih",
                  maxLines: 1,
                ),
                SizedBox(
                  height: 20.0,
                  width: 20.0,
                  child: IconButton(
                    padding: EdgeInsets.all(0.0),
                    icon: Icon(Icons.edit),
                    iconSize: 15.0,
                    onPressed: () => {},
                  )
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  static Widget buildEditableButton({@required bool isEditable, String url}) {
    if (isEditable) {
      return SizedBox(
        height: 20.0,
        width: 20.0,
        child: IconButton(
          padding: EdgeInsets.all(0.0),
          icon: Icon(Icons.edit),
          iconSize: 15.0,
          onPressed: () => {},
        ),
      );
    } else {
      return SizedBox(
        height: 0.0,
        width: 0.0,
      );
    }
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

  static Widget buildField({@required String name, String type, String url, @required String value, bool isEditable = true, bool isMultiline = false}) {
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
              ),
              buildEditableButton(
                isEditable:isEditable
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
                  value: "Laki-laki",
                  isEditable: false,
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

  static Widget buildProfileFragment() {
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
}