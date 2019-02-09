import 'package:flutter/material.dart';
import 'promoDetail.dart';
import '../datas/promos.dart';

class PromoFragment {

  static gotoDetail(BuildContext context, String url, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PromoDetail(url:url))
    );
  }

  static Widget buildPromo(BuildContext context, int index) {
    return GestureDetector(
      onTap: () => gotoDetail(context, index.toString(), index),
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
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Image.network(Promos.promos[index]['photo'] + '?x=' + index.toString()),
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
                    Text(Promos.promos[index]['title'],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(Promos.promos[index]['status'],
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(Promos.promos[index]['content'],
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
        itemCount: Promos.promos.length,
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