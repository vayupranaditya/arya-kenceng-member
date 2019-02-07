import 'package:flutter/material.dart';
import 'memberDetail.dart';
import '../datas/users.dart';

class MemberFragment {

  static gotoDetail(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MemberDetail(url:url))
    );
  }

  static Widget buildMemberListTile(BuildContext context, int index) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(    //left
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.orange[300],
                          backgroundImage: NetworkImage(UserSummary.getUser(index)['profilePicture']),
                        ),
                        width: 60.0,
                        height: 60.0,
                      )
                    ],
                  ),
                ),
                Expanded(   //right
                  child: Container(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(UserSummary.getUser(index)['name'],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          maxLines: 1,
                        ),
                        Text(UserSummary.getUser(index)['jroPuri'],
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  )
                )
              ],
            ),
            padding: EdgeInsets.only(left: 5.0),
            color: Colors.transparent,
          ),
        ],
      ),
      onTap: () => gotoDetail(context, UserSummary.getUser(index)['phoneNumber'])
    );
  }

  static Widget buildMemberList() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey,
        ),
        itemCount: UserSummary.users.length,
        itemBuilder: (BuildContext context, int index) => buildMemberListTile(context, index),
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
      ),
    );
  }

  static Widget buildMemberSearchBox() {
    return new Container(
      margin: EdgeInsets.all(5.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Cari anggota..",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))
          ),
          contentPadding: EdgeInsets.all(10.0),
        )
      ),
    );
  }

  static Widget buildMemberFragment() {
    return Column(
      children: <Widget>[
        buildMemberSearchBox(),
        buildMemberList(),  
      ],
    );
  }
}