import 'package:flutter/material.dart';

import '../models/article.dart';
import '../service/firebase_service.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage(this.id, {super.key});

  final String id;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  final firebaseService = FirebaseService();
  late Future<Article?> futureArticle;

  @override
  void initState() {
    super.initState();
    futureArticle = firebaseService.getArticle(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Article?>(
        future: futureArticle,
        builder: (context, article) {
          if (article.hasData) {
            return Center(
              child: Text(
                'Article : ${article.data?.title} ${article.data?.content}',
              ),
            );
          } else if (article.hasError) {
            return Text('${article.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
