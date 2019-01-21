import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Ciee pake flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(85.0),
            child: AppBar(
              title: Text("Arya Kenceng"),
              bottom: TabBar(
                tabs: <Widget>[
                  AutoSizeText(
                    "Anggota",
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "Kabar",
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "Promo",
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    "Profil",
                    maxLines: 1,
                  ),
                ],
              ),
              backgroundColor: Colors.orange[400],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ //per tab
              Container(
                child: Column(
                  children: <Widget>[
                    Container(
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
                    ),
                  ],
                ),
              ),
              Icon(Icons.wrap_text),
              Icon(Icons.shopping_cart),
              Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
