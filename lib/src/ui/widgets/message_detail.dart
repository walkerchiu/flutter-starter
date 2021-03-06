import 'package:flutter/material.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/ui/widgets/header.dart';

class MessageDetail extends StatefulWidget {
  final String _content;
  final String _date;

  MessageDetail(this._content, this._date);

  @override
  MessageDetailState createState() {
    return MessageDetailState();
  }
}

class MessageDetailState extends State<MessageDetail> with SingleTickerProviderStateMixin {
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
    return Column(
              children: <Widget>[
                Header(true, I18n.of(context).menuMessage),
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
                        padding: EdgeInsets.only(top: 3.0, bottom: 30.0),
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
                        padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
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