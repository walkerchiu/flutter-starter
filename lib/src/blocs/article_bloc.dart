import 'package:rxdart/rxdart.dart';

import 'package:flutterstarter/src/resources/repository.dart';
import 'package:flutterstarter/src/models/article.dart';

class ArticleBloc {
  final _repository = Repository();
  final _articles = PublishSubject<List<Article>>();

  Observable<List<Article>> get allArticles => _articles.stream;

  Future<List<Article>> newsList() {
    return _repository.getNewsList();
  }

  //dispose all open sink
  void dispose() async {
    _articles.close();
  }
}