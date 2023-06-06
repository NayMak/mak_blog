import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'article/article_view.dart';
import 'firebase_options.dart';
import 'home/home_view.dart';

void main() {
  runApp(const MyApp());
}

Future<void> firebaseInitialization() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    firebaseInitialization();

    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/home',
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
            routes: <RouteBase>[
              GoRoute(
                name: 'article',
                path: 'article/:articleId',
                builder: (BuildContext context, GoRouterState state) {
                  return ArticleView(id: state.pathParameters['articleId']!);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
