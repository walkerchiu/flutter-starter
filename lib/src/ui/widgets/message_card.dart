import 'package:flutter/material.dart';

import 'package:flutterstarter/src/ui/screens/message.dart';

class MessageCard extends StatefulWidget {
  final String _content;
  final String _date;

  MessageCard(this._content, this._date);

  @override
  MessageCardState createState() {
    return MessageCardState();
  }
}

class MessageCardState extends State<MessageCard> with SingleTickerProviderStateMixin {
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(widget._content, widget._date)));
            },
            child:
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 10),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFDFDFDF))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                      ],
                    ),
                    Container(
                      width: 18, height: 25,
                      padding: EdgeInsets.only(bottom: 5.0),
                      child:
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: (){
                            setState((){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MessageScreen(widget._content, widget._date)));
                            });
                          },
                          child: 
                            Image(image: new AssetImage('assets/arrow01.png'),
                                  color: Color(0xFF339C01))
                        )
                    ),
                  ]
                )
              )
    );
  }
}