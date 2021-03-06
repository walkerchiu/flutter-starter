class Article {
  final String id;
  final String photo;
  final String title;
  final String content;
  final String date;

  Article({this.id, this.photo, this.title, this.content, this.date});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      photo: json['photo'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
