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

  List <List <String>> name = [
    ["I Gusti Bagus Vayupranaditya Putraadinatha", "Jro Titih"], 
    ["I Gusti Bagus Satcitananda Putraadinatha", "Jro Titih"], 
    ["Nama lengkap anggota", "Nama jro"], 
    ["Lorem ipsum dolor sit amet", "Lorem ipsum"], 
    ["Martabak", "Milk tea"], 
    ["Babi guling", "Thai tea"], 
    ["Sri Nararya Kenceng", "Arya Kenceng"], 
    ["Flutter 1.0", "Jro Ketut"], 
    ["Android", "Jro Gede"], 
    ["Google", "Apple"]
  ];

  Widget buildMemberListTile(BuildContext context, int index) {
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
                          backgroundColor: Colors.lime,
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
                        Text(name[index][0],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                          ),
                          maxLines: 1,
                        ),
                        Text(name[index][1],
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
      onTap: (){
        print(name[index][0] + " clicked");
      },
    );
  }

  Widget buildMemberList() {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.grey,
        ),
        itemCount: name.length,
        itemBuilder: (BuildContext context, int index) => buildMemberListTile(context, index),
        padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
      ),
    );
  }

  Widget buildMemberSearchBox() {
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

  Widget buildMemberFragment() {
    return Column(
      children: <Widget>[
        buildMemberSearchBox(),
        buildMemberList(),  
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
              buildMemberFragment(),
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
