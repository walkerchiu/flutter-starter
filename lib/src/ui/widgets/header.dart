import 'package:flutter/material.dart';

import 'package:flutterstarter/generated/i18n.dart';

class Header extends StatelessWidget {
  final bool _isPage;
  final String _title;

  Header(this._isPage, this._title);

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 5),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(_title, style: TextStyle(color: Color(0xFF595957), fontSize: 24)),
              if (_isPage)
                Container(
                  width: 55, height: 22,
                  child: 
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: <Widget>[
                          new Image(image: new AssetImage('assets/homenback_arrow.png'),
                                    color: Color(0xFF339C01),
                                    height: 22),
                          Text(I18n.of(context).back, style: TextStyle(color: Color(0xFF339C01), fontSize: 14))
                        ]
                      )
                    )
                )
            ],
          )
      );
  }
}