import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:flutterstarter/src/resources/repository.dart';

class LoginBloc {
  final _repository = Repository();
  final _memberID = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _isSignedIn = BehaviorSubject<bool>();

  Observable<String> get memberID => _memberID.stream.transform(_validateMemberID);

  Observable<String> get password =>
      _password.stream.transform(_validatePassword);

  Observable<bool> get signInStatus => _isSignedIn.stream;

  // Change data
  Function(String) get changeMemberID => _memberID.sink.add;

  Function(String) get changePassword => _password.sink.add;

  Function(bool) get showProgressBar => _isSignedIn.sink.add;

  final _validateMemberID =
      StreamTransformer<String, String>.fromHandlers(handleData: (memberID, sink) {
    if (memberID.length >= 8) {
      sink.add(memberID);
    } else {
      sink.addError("length");
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 8) {
      sink.add(password);
    } else {
      sink.addError("length");
    }
  });

  Future<int> submit() {
    return _repository.authenticateUser(_memberID.value, _password.value);
  }

  void dispose() async {
    await _memberID.drain();
    _memberID.close();
    await _password.drain();
    _password.close();
    await _isSignedIn.drain();
    _isSignedIn.close();
  }

  bool validateFields() {
    if (_memberID.value != null &&
        _memberID.value.isNotEmpty &&
        _memberID.value.length >= 8 &&
        _password.value != null &&
        _password.value.isNotEmpty &&
        _password.value.length >= 8) {
      return true;
    } else {
      return false;
    }
  }
}