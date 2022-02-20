import 'package:flutter/material.dart';

import 'package:flutterstarter/src/blocs/login_bloc.dart';
export 'package:flutterstarter/src/blocs/login_bloc.dart';

class LoginBlocProvider extends InheritedWidget{
  final bloc = LoginBloc();

  LoginBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginBlocProvider) as LoginBlocProvider).bloc;
  }
}