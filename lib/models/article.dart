import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  final String title;
  final String summary;
  final String content;
  final String? id;

  Article({
    required this.title,
    required this.summary,
    required this.content,
    this.id,
  });

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
