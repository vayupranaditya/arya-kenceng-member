import 'package:flutter/material.dart';
import 'promoDetail.dart';

class PromoFragment {

  static List <List <String>> promo = [
    ["Promo", "Siap ditukar", "Penjelasan promo"],
    ["Promo", "Siap ditukar", "Penjelasan promo"],
    ["Promo", "Tersedia", "Penjelasan promo"],
    ["Promo", "Tersedia", "Penjelasan promo"],
    ["Promo", "Tersedia", "Penjelasan promo"],
    ["Promo", "Tersedia", "Penjelasan promo"],
    ["Promo", "Sudah digunakan", "Penjelasan promo"],
    ["Promo", "Sudah digunakan", "Penjelasan promo"],
  ];

  static gotoDetail(BuildContext context, String url, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PromoDetail(url:url + " " + index.toString()))
    );
  }

  static Widget buildPromo(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => gotoDetail(context, promo[index][1], index),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey)
          ),
        ),
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(promo[index][0] + " " + index.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(promo[index][1],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text((promo[index][2] + " ") * 10,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      )
    );
  }

  static Widget buildPromoList() {
    return Expanded(
      child: ListView.builder(
        itemCount: promo.length,
        itemBuilder: (BuildContext context, int index) => buildPromo(context, index),
      ),
    );
  }

  static Widget buildPromoFragment() {
    return Column(
      children: <Widget>[
        buildPromoList(),
      ],
    );
  }
}