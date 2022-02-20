import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' show Client, Response;

import 'package:flutterstarter/src/models/profile.dart';
import 'package:flutterstarter/src/models/article.dart';

class BackendProvider {
  Client client = Client();
  final _apiKey = 'api-key';
  final _baseUrl = "https://example.com/auth/login";

  Future<int> authenticateUser(String memberID, String password) async {
      return 1;
    final response = await client.post(
      'https://example.com/auth/login',
      headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"},
    );
    final responseJson = json.decode(response.body);

    if (responseJson.memberID == 0) {
      return 0;
    } else {
      Profile.fromJson(responseJson);
      return 1;
    }
  }

  Future<Profile> getProfile(String memberID) async {
    return new Profile(memberID: "1ds1ds34s", market: "AAA");
    Response response;
    response = await client.get("$_baseUrl/$memberID/videos?api_key=$_apiKey");

    if (response.statusCode == 200) {
      return Profile.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }

  Future<List<Article>> getNewsList() async {
    // var ll = new List<Article>();
    // ll.add(Article(id: 1, photo: 'bhbh', title: 'sdsf', content: 'sdsds', date: '0000-00-00'));
    // return ll;
    //response = await client.get("$_baseUrl/popular?api_key=$_apiKey");
    Response response;
    response = await client.get("https://example.net/api/news",
      headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"});
    if (response.statusCode > 200) {
      return json.decode(response.body).map<Article>((dynamic article) => Article.fromJson(article)).toList();
    } else {
      print(response.statusCode);
      return json.decode(response.body).map<Article>((dynamic article) => Article.fromJson(article)).toList();
    }
  }
}