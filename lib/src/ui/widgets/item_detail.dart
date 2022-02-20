import 'package:flutter/material.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/ui/widgets/header.dart';

class ItemDetail extends StatefulWidget {
  final String _route;
  final String _photo;
  final String _title;
  final String _content;
  final String _date;

  ItemDetail(this._route, this._photo, this._title, this._content, this._date);

  @override
  ItemDetailState createState() {
    return ItemDetailState();
  }
}

class ItemDetailState extends State<ItemDetail> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String header;
    switch (widget._route) {
      case "news":
        header = I18n.of(context).menuNews;
        break;
      case "event": 
        header = I18n.of(context).menuEvent;
        break;
    }

    return Column(
              children: <Widget>[
                Header(true, header),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 12.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFDFDFDF))
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(bottom: 5.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFFDFDFDF)))
                        ),
                        child:
                          Text(widget._title.toUpperCase(), style: TextStyle(color: Color(0xFF339C01), fontSize: 14, fontWeight: FontWeight.bold))
                      ),
                      if (widget._photo != "")
                        Container(
                          padding: EdgeInsets.only(top: 15.0),
                          child:
                            Image.network(widget._photo)
                        ),
                      Container(
                        padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFFDFDFDF)))
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(widget._content, style: TextStyle(color: Color(0xFF595957), fontSize: 12))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                        child: Row(
                          children: <Widget>[
                            Text(widget._date, style: TextStyle(color: Color(0xFF1B74A1), fontSize: 12))
                          ],
                        ),
                      )
                    ]
                  )
                )
              ]
    );
  }
}