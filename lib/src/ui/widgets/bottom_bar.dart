import 'package:flutter/material.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/ui/screens/news.dart';
import 'package:flutterstarter/src/ui/screens/event.dart';
import 'package:flutterstarter/src/ui/screens/message.dart';

class BottomBar extends StatefulWidget {
  final int _navState;

  BottomBar(this._navState);

  @override
  BottomBarState createState() {
    return BottomBarState();
  }
}

class BottomBarState extends State<BottomBar> with SingleTickerProviderStateMixin {
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
    return BottomAppBar(
        color: Color(0xFFEBEBEB),
        child: Container(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
                Container(
                  width: 80,
                  child: 
                    FlatButton(
                      onPressed: (){
                        setState((){
                          if (widget._navState != 1)
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsScreen("", "", "", "")));
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          new Image(image: new AssetImage('assets/menu_icon01.png'),
                                    color: widget._navState == 1 ? Color(0xFF036296) : Color(0xFF339C01)),
                          Text(I18n.of(context).tabNews, style: TextStyle(color: Color(0xFF595957), fontSize: 11))
                        ]
                      )
                    )
                ),
                Container(
                  width: 80,
                  child: 
                    FlatButton(
                      onPressed: (){
                        setState((){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EventScreen("", "", "", "")));
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          new Image(image: new AssetImage('assets/menu_icon02.png'),
                                    color: widget._navState == 2 ? Color(0xFF036296) : Color(0xFF339C01)),
                          Text(I18n.of(context).tabEvent, style: TextStyle(color: Color(0xFF595957), fontSize: 11))
                        ]
                      )
                    )
                ),
                Container(
                  width: 80,
                  child: 
                    FlatButton(
                      onPressed: (){
                        setState((){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MessageScreen("", "")));
                        });
                      },
                      child: Column(
                        children: <Widget>[
                          new Image(image: new AssetImage('assets/menu_icon03.png'),
                                    color: widget._navState == 3 ? Color(0xFF036296) : Color(0xFF339C01)),
                          Text(I18n.of(context).tabMessage, style: TextStyle(color: Color(0xFF595957), fontSize: 11))
                        ]
                      )
                    )
                )
            ],
          ),
        ),
      );
  }
}
