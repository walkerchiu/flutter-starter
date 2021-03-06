import 'package:flutter/material.dart';

import 'package:flutterstarter/src/ui/screens/news.dart';
import 'package:flutterstarter/src/ui/screens/event.dart';

class ItemCard extends StatefulWidget {
  final String _route;
  final String _photo;
  final String _title;
  final String _content;
  final String _date;

  ItemCard(this._route, this._photo, this._title, this._content, this._date);

  @override
  ItemCardState createState() {
    return ItemCardState();
  }
}

class ItemCardState extends State<ItemCard> with SingleTickerProviderStateMixin {
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
    return GestureDetector(
            onTap: (){
              switch (widget._route) {
                case "news":
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen(widget._photo, widget._title, widget._content, widget._date)));
                  break;
                case "event": 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen(widget._photo, widget._title, widget._content, widget._date)));
                  break;
              }
            },
            child:
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 10),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDFDFDF))
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 5.0),
                      decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 2.0, color: Color(0xFFDFDFDF)))
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(widget._title.toUpperCase(), style: TextStyle(color: Color(0xFF339C01), fontSize: 14, fontWeight: FontWeight.bold)),
                          Container(
                            width: 18, height: 18,
                            child: 
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: (){
                                  setState((){
                                    switch (widget._route) {
                                      case "news":
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewsScreen(widget._photo, widget._title, widget._content, widget._date)));
                                        break;
                                      case "event": 
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => EventScreen(widget._photo, widget._title, widget._content, widget._date)));
                                        break;
                                    }
                                  });
                                },
                                child: 
                                  Image(image: new AssetImage('assets/arrow01.png'),
                                        color: Color(0xFF339C01))
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: <Widget>[
                          Text(widget._content, style: TextStyle(color: Color(0xFF595957), fontSize: 12))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: Row(
                        children: <Widget>[
                          Text(widget._date, style: TextStyle(color: Color(0xFF1B74A1), fontSize: 12))
                        ],
                      ),
                    )
                  ]
                )
              )
    );
  }
}