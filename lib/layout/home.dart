import 'package:flutter/material.dart';
import 'homeMember.dart';
import 'newsfeed.dart';
import 'promo.dart';
import 'homeProfile.dart';
import 'components/global.dart';

class HomeFragment {
  static Widget buildHomeFragment() {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              title: ActivityTitle('Arya Kenceng Connect'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => {},
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(15.0),
                child: TabBar(
                  tabs: <Widget>[
                    DefaultTabContent('Anggota'),
                    DefaultTabContent('Kabar'),
                    DefaultTabContent('Promo'),
                    DefaultTabContent('Profil')
                  ],
                ),
              ),
              backgroundColor: Colors.orange[400],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ //per tab
              MemberFragment.buildMemberFragment(),
              NewsfeedFragment(),
              PromoFragment(),
              ProfileFragment.buildProfileFragment(),
            ],
          ),
        ),
      ),
    );
  }
}