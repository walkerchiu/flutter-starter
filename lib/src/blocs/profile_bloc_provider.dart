import 'package:flutter/material.dart';

import 'package:flutterstarter/src/blocs/profile_bloc.dart';
export 'package:flutterstarter/src/blocs/profile_bloc.dart';

class ProfileBlocProvider extends InheritedWidget{
  final bloc = ProfileBloc();

  ProfileBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ProfileBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ProfileBlocProvider) as ProfileBlocProvider).bloc;
  }
}