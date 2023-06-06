import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({
    required this.name,
    required this.title,
    required this.summary,
    required this.content,
    super.key,
  });

  final String name;
  final String title;
  final String summary;
  final String content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed('article', pathParameters: {'articleId': name});
      },
      child: Column(
        children: [
          Text(title),
          Text(summary),
          Text(content),
        ],
      ),
    );
  }
}
