import 'package:flutterstarter/src/resources/backend_provider.dart';
import 'package:flutterstarter/src/models/article.dart';
import 'package:flutterstarter/src/models/profile.dart';

class Repository {
  final _backendProvider = BackendProvider();

  Future<int> authenticateUser(String memberID, String password) =>
      _backendProvider.authenticateUser(memberID, password);

  Future<Profile> getProfile(String memberID) =>
      _backendProvider.getProfile(memberID);

  Future<List<Article>> getNewsList() =>
      _backendProvider.getNewsList();
}