import 'package:flutter/material.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/blocs/profile_bloc_provider.dart';
import 'package:flutterstarter/src/models/profile.dart';
import 'package:flutterstarter/src/ui/home.dart';
import 'package:flutterstarter/src/ui/widgets/drawer_menu.dart';
import 'package:flutterstarter/src/ui/widgets/bottom_bar.dart';

class TermsScreen extends StatefulWidget {
  TermsScreen();

  @override
  TermsScreenState createState() {
    return TermsScreenState();
  }
}

class TermsScreenState extends State<TermsScreen> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ProfileBloc _bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ProfileBlocProvider.of(context);
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
      body: FutureBuilder<Profile>(
        future: _bloc.getProfile('sasa'),
        builder: (BuildContext context, AsyncSnapshot<Profile> snapshot) {
          final profile = snapshot.data;
          
          return Column(
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 25.0, color: Color(0xFFDFDFDF))
                  )
                )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16, top: 15, bottom: 5),
                    child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(I18n.of(context).menuTerms, style: TextStyle(color: Color(0xFF595957), fontSize: 24)),
                          Container(
                            width: 60, height: 22,
                            child: 
                              FlatButton(
                                padding: EdgeInsets.all(0),
                                onPressed: (){
                                  setState((){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                                  });
                                },
                                child: Row(
                                  children: <Widget>[
                                    new Image(image: new AssetImage('assets/homenback_arrow.png'),
                                              color: Color(0xFF339C01),
                                              height: 22),
                                    Text(I18n.of(context).home, style: TextStyle(color: Color(0xFF339C01), fontSize: 14))
                                  ]
                                )
                              )
                          )
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Color(0xFFDFDFDF), style: BorderStyle.solid)
                    ),
                    child:
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child:
                              Image(image: AssetImage('assets/aboutus_banner.png'))
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 30),
                            child:
                              Text(profile.memberID, style: TextStyle(color: Color(0xFF919191), fontSize: 16, height: 1.2))
                          )
                        ]
                      )
                  )
                ]
              )
            ]
          );
        }
      ),
      drawer: DrawerMenu(1),
      bottomNavigationBar: BottomBar(0),
    );
  }
}
