import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

import 'package:flutterstarter/src/ui/widgets/news_list.dart';
import 'package:flutterstarter/src/ui/widgets/drawer_menu.dart';
import 'package:flutterstarter/src/ui/widgets/bottom_bar.dart';

class Home extends StatefulWidget {
  Home();

  @override
  HomeState createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
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
      resizeToAvoidBottomPadding: false,
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
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
              height: 155.0,
              width: 350.0,
              child: Carousel(
                images: [
                  ExactAssetImage("assets/banner01.jpg"),
                  ExactAssetImage("assets/banner02.jpg"),
                  ExactAssetImage("assets/banner03.jpg")
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.white,
                dotBgColor: Colors.white.withOpacity(0.1),
                indicatorBgPadding: 5.0,
              )
          ),
          //Image.asset("assets/banner01.jpg"),
          NewsList()
        ]
      ),
      drawer: DrawerMenu(0),
      bottomNavigationBar: BottomBar(0),
    );
  }
}
