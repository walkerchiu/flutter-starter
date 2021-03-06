import 'package:flutter/material.dart';

import 'package:flutterstarter/src/ui/widgets/sign_in_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      alignment: Alignment(0.0,0.0),
      child: SignInForm(),
    );
  }
}