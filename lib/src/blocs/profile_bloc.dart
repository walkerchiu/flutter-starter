import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:flutterstarter/src/resources/repository.dart';
import 'package:flutterstarter/src/models/profile.dart';

class ProfileBloc {
  final _repository = Repository();
  final _memberID = BehaviorSubject<String>();
  final _market = BehaviorSubject<String>();

  Observable<String> get memberID => _memberID.transform(_validateMemberID);
  Observable<String> get market => _market.transform(_validateMarket);

  Function(String) get changeMemberID => _memberID.sink.add;
  Function(String) get changeMarket => _market.sink.add;

  final _validateMemberID = StreamTransformer<String, String>.fromHandlers(handleData: (memberID, sink) {
    if (memberID.length > 1) {
      sink.add(memberID);
    } else {
      sink.addError('error');
    }
  });

  final _validateMarket = StreamTransformer<String, String>.fromHandlers(handleData: (market, sink) {
    if (market.length > 1) {
      sink.add(market);
    } else {
      sink.addError('error');
    }
  });


  Future<Profile> getProfile(String memberID) {
    return _repository.getProfile(memberID);
  }

  //dispose all open sink
  void dispose() async {
    await _memberID.drain();
    _memberID.close();
    await _market.drain();
    _market.close();
  }
}
