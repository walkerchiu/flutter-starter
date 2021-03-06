import 'package:flutter/material.dart';

import 'package:flutterstarter/src/ui/widgets/news_list.dart';
import 'package:flutterstarter/src/ui/widgets/item_detail.dart';
import 'package:flutterstarter/src/ui/widgets/drawer_menu.dart';
import 'package:flutterstarter/src/ui/widgets/bottom_bar.dart';

class NewsScreen extends StatefulWidget {
  final String _photo;
  final String _title;
  final String _content;
  final String _date;

  NewsScreen(this._photo, this._title, this._content, this._date);

  @override
  NewsScreenState createState() {
    return NewsScreenState();
  }
}

class NewsScreenState extends State<NewsScreen> with SingleTickerProviderStateMixin {
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
          widget._title == "" ? NewsList() : ItemDetail("news", widget._photo, widget._title, widget._content, widget._date)
        ]
      ),
      drawer: DrawerMenu(1),
      bottomNavigationBar: BottomBar(1),
    );
  }
}
