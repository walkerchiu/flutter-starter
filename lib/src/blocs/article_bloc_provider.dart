import 'package:flutter/material.dart';

import 'package:flutterstarter/src/blocs/article_bloc.dart';
export 'package:flutterstarter/src/blocs/article_bloc.dart';

class ArticleBlocProvider extends InheritedWidget{
  final bloc = ArticleBloc();

  ArticleBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ArticleBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ArticleBlocProvider) as ArticleBlocProvider).bloc;
  }
}