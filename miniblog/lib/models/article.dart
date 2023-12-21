import 'dart:convert';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  final String id;
  final String title;
  final String content;
  final String thumbnail;
  final String author;

  Article({
    required this.id,
    required this.title,
    required this.content,
    required this.thumbnail,
    required this.author,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        thumbnail: json["thumbnail"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "thumbnail": thumbnail,
        "author": author,
      };
}
