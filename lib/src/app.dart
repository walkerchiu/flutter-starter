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
  final i18n = I18n.delegate;

  @override
  void initState() {
    super.initState();
    I18n.onLocaleChanged = onLocaleChange;
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
                  body: LoginScreen(),
                ),
              ),
            ),
          )
        );
  }
}