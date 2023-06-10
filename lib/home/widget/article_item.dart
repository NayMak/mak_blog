import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../models/article.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem(
    this.article, {
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(
          'article',
          pathParameters: {'id': article.id!},
        );
      },
      child: Column(
        children: [
          Text(article.title),
          Text(article.summary),
          Text(article.content),
        ],
      ),
    );
  }
}
