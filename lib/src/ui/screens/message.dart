import 'package:flutter/material.dart';

import 'package:flutterstarter/src/ui/widgets/message_list.dart';
import 'package:flutterstarter/src/ui/widgets/message_detail.dart';
import 'package:flutterstarter/src/ui/widgets/drawer_menu.dart';
import 'package:flutterstarter/src/ui/widgets/bottom_bar.dart';

class MessageScreen extends StatefulWidget {
  final String _content;
  final String _date;

  MessageScreen(this._content, this._date);

  @override
  MessageScreenState createState() {
    return MessageScreenState();
  }
}

class MessageScreenState extends State<MessageScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image(image: AssetImage('assets/login_logo.png'), width: 150.0),
        elevation: 0.0,
        actions: <Widget>[
          new Container(
            width: 80,
            child: IconButton(icon: new Image(image: new AssetImage('assets/menu01.png'),
                                              color: Color(0xFF339C01)),
                              onPressed: (){
                                _scaffoldKey.currentState.openDrawer();
                              },
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 25.0, color: Color(0xFFDFDFDF))
              )
            )
          ),
          widget._content == "" ? MessageList() : MessageDetail(widget._content, widget._date)
        ]
      ),
      drawer: DrawerMenu(1),
      bottomNavigationBar: BottomBar(3),
    );
  }
}
