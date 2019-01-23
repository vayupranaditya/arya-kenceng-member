import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'homeMember.dart';
import 'homeNewsfeed.dart';

class HomeFragment {
  static Widget buildHomeFragment() {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
              title: Text("Arya Kenceng"),
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
                    Tab(
                      child: AutoSizeText(
                        "Anggota",
                        maxLines: 1,
                      ),
                    ),
                    Tab(
                      child: AutoSizeText(
                        "Kabar",
                        maxLines: 1,
                      ),
                    ),
                    Tab(
                      child: AutoSizeText(
                        "Promo",
                        maxLines: 1,
                      ),
                    ),
                    Tab(
                      child: AutoSizeText(
                        "Profil",
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.orange[400],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ //per tab
              MemberFragment.buildMemberFragment(),
              NewsfeedFragment.buildNewsfeedFragment(),
              Icon(Icons.shopping_cart),
              Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}