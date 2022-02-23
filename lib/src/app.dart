import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/blocs/article_bloc_provider.dart';
import 'package:flutterstarter/src/blocs/login_bloc_provider.dart';
import 'package:flutterstarter/src/blocs/profile_bloc_provider.dart';
import 'package:flutterstarter/src/ui/login.dart';

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final i18n = I18n.delegate;

  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
    I18n.onLocaleChanged = onLocaleChange;
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.getToken().then((token){
      print("token:"+token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
          // TODO optional
      },
      onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
          // TODO optional
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      I18n.locale = locale;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginBlocProvider(
          child: ProfileBlocProvider(
            child: ArticleBlocProvider(
              child: MaterialApp(
                localizationsDelegates: [
                  i18n,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: i18n.supportedLocales,
                theme: ThemeData(
                  accentColor: Color(0xFF339C01),
                  primaryColor: Colors.white,
                ),
                home: Scaffold(
                  resizeToAvoidBottomPadding: false,
                  body: LoginScreen(),
                ),
              ),
            ),
          )
        );
  }
}