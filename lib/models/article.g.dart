// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Article _$ArticleFromJson(Map<String, dynamic> json) => Article(
      title: json['title'] as String,
      summary: json['summary'] as String,
      content: json['content'] as String,
      publicationDate: json['publicationDate'] as int,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ArticleToJson(Article instance) => <String, dynamic>{
      'title': instance.title,
      'summary': instance.summary,
      'content': instance.content,
      'publicationDate': instance.publicationDate,
      'id': instance.id,
    };
