import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/ui/home.dart';
import 'package:flutterstarter/src/ui/screens/myprofile.dart';
import 'package:flutterstarter/src/ui/screens/aboutus.dart';
import 'package:flutterstarter/src/ui/screens/news.dart';
import 'package:flutterstarter/src/ui/screens/event.dart';
import 'package:flutterstarter/src/ui/screens/message.dart';

class DrawerMenu extends StatefulWidget {
  final int _navState;

  DrawerMenu(this._navState);

  @override
  DrawerMenuState createState() {
    return DrawerMenuState();
  }
}

class DrawerMenuState extends State<DrawerMenu> with SingleTickerProviderStateMixin {
  String nowLanguage;

  Future<void> _askedToLead() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: new Text(I18n.of(context).i18nSelect),
            children: <Widget>[
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, "en-US"); },
                child: new Text(I18n.of(context).i18nEnUSName),
              ),
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, "zh-TW"); },
                child: new Text(I18n.of(context).i18nZhTWName),
              ),
            ],
          );
        }
      )
    ) {
      case "en-US":
        I18n.onLocaleChanged(Locale('en', 'US'));
        Navigator.of(context).pop();
        saveLanguage('en_US');
        break;
      case "zh-TW":
        I18n.onLocaleChanged(Locale('zh', 'TW'));
        Navigator.of(context).pop();
        saveLanguage('zh_TW');
        break;
    }
  }

  loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('language') ?? Localizations.localeOf(context).toString();

    setState(() {
      switch (value){
        case "en_US":
            nowLanguage = I18n.of(context).i18nEnUSNick.toString();
          break;
        case "zh_TW":
            nowLanguage = I18n.of(context).i18nZhTWNick.toString();
          break;
      }
    });
  }

  saveLanguage(language) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('language', language);
  }

  @override
  void initState() {
    super.initState();
    loadLanguage();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith( canvasColor: Color(0xFF339C01) ),
        child: Drawer(
            child: ListView(
              children: <Widget>[
                Container(
                  height: 75.0,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: DrawerHeader(
                        child: Text(I18n.of(context).menuTitle, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        margin: EdgeInsets.only(left: 15, top: 20),
                  ),
                ),
                ListTile(
                  title: Text(I18n.of(context).menuHome, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    setState((){
                      Navigator.pop(context);
                      if (widget._navState != 0)
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home()));
                    });
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuProfile, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyProfileScreen()));
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuNews, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NewsScreen("", "", "", "")));
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuEvent, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => EventScreen("", "", "", "")));
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuMessage, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MessageScreen("", "")));
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuAboutus, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AboutUsScreen()));
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuTerms, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuPolicy, style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
                ListTile(
                  title: Text(I18n.of(context).menuLanguage(nowLanguage), style: TextStyle(color: Colors.white)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 32.0),
                  onTap: () {
                    _askedToLead();
                  }
                ),
                Divider(height: 2.0, color: Colors.white),
              ],
            )
        )
      );
  }
}