import 'package:flutter/material.dart';
import '../models/article.dart';
import '../service/firebase_service.dart';
import 'widget/article_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firebaseService = FirebaseService();
  late Future<List<Article>> futureArticles;

  @override
  void initState() {
    super.initState();
    futureArticles = firebaseService.getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Article>>(
        future: futureArticles,
        builder: (context, articles) {
          if (articles.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: articles.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return ArticleItem(articles.data![index]);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            );
          } else if (articles.hasError) {
            return Text('${articles.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
