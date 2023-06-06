import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({required this.id, super.key});

  final String id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Article numéro $id')),
    );
  }
}
