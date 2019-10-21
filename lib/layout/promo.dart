import 'package:aryakenceng_member/layout/components/promo/global.dart';
import 'package:flutter/material.dart';
import 'promoDetail.dart';
import '../datas/promos.dart';

class PromoFragment extends StatelessWidget{

  final List <Map <String, String>> promo = Promos.promos;

  void _gotoDetail(BuildContext context, String url, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PromoDetail(url:url))
    );
  }

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Expanded(
        child: ListView.builder(
          itemCount: Promos.promos.length,
          itemBuilder: (BuildContext context, int index) => PromoTile(
            this.promo[index]['title'],
            this.promo[index]['status'],
            this.promo[index]['photo'],
            this.promo[index]['content']
          ),
        ),
      )
    ],
  );
}