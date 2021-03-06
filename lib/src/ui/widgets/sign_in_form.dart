import 'package:flutter/material.dart';

import 'package:flutterstarter/generated/i18n.dart';
import 'package:flutterstarter/src/blocs/login_bloc_provider.dart';
import 'package:flutterstarter/src/ui/home.dart';

class SignInForm extends StatefulWidget {
  @override
  SignInFormState createState() {
    return SignInFormState();
  }
}

class SignInFormState extends State<SignInForm> {
  LoginBloc _bloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = LoginBlocProvider.of(context);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.only(top: 60.0),
                  child: Image(image: AssetImage('assets/login_logo.png'))),
        Container(margin: EdgeInsets.only(top: 20.0),
                  child: memberIDField(context)),
        Container(margin: EdgeInsets.only(top: 20.0),
                  child: passwordField(context)),
        Container(margin: EdgeInsets.only(top: 30.0),
                  child: submitButton())
      ],
    );
  }

  Widget passwordField(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.password,
        builder: (context, AsyncSnapshot<String> snapshot) {
          var errorText;
          switch (snapshot.error){
            case "length":
              errorText = I18n.of(context).validateLengthMin;
              break;
          }

          return TextField(
            onChanged: _bloc.changePassword,
            obscureText: true,
            decoration: InputDecoration(
                hintText: I18n.of(context).passwordHint,
                errorText: errorText),
          );
        });
  }

  Widget memberIDField(BuildContext context) {
    return StreamBuilder(
        stream: _bloc.memberID,
        builder: (context, snapshot) {
          var errorText;
          switch (snapshot.error){
            case "length":
              errorText = I18n.of(context).validateLengthMin;
              break;
          }

          return TextField(
            onChanged: _bloc.changeMemberID,
            decoration: InputDecoration(
                hintText: I18n.of(context).memberIDHint,
                errorText: errorText),
          );
        });
  }

  Widget submitButton() {
    return StreamBuilder(
        stream: _bloc.signInStatus,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return button();
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  Widget button() {
    return ButtonTheme(
      minWidth: double.infinity,
      child: new RaisedButton(
        child: Text(I18n.of(context).btnLogin),
        textColor: Colors.white,
        color: Color(0xFF339C01),
        onPressed: () {
          if (_bloc.validateFields()) {
            authenticateUser();
          } else {
            showErrorMessage();
          }
        })
    );
  }

  void authenticateUser() {
    _bloc.showProgressBar(true);
    _bloc.submit().then((value) {
      if (value == 0) {
        //New User
      } else {
        //Already registered
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Home()));
      }
    });
  }

  void showErrorMessage() {
    final snackbar = SnackBar(
        content: Text(I18n.of(context).validateHeader),
        duration: new Duration(seconds: 2));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}