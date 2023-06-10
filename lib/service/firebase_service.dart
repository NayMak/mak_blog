import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/article.dart';

class FirebaseService {
  final articlesCollection =
      FirebaseFirestore.instance.collection('articles').withConverter<Article>(
            fromFirestore: (snapshot, _) => Article.fromJson(snapshot.data()!),
            toFirestore: (article, _) => article.toJson(),
          );

  Future<List<Article>> getArticles() async {
    final articles = (await articlesCollection.get())
        .docs
        .map(
          (value) => Article(
            title: value.data().title,
            summary: value.data().summary,
            content: value.data().content,
            id: value.reference.id,
          ),
        )
        .toList();
    return articles;
  }

  Future<Article?> getArticle(String documentId) async {
    final article = await articlesCollection
        .doc(documentId)
        .get()
        .then((value) => value.data());
    return article;
  }
}
