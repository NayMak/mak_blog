import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'article/article_page.dart';
import 'firebase_options.dart';
import 'home/home_page.dart';

void main() async {
  await firebaseInitialization();
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
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/home',
        routes: <RouteBase>[
          GoRoute(
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomePage();
            },
            routes: <RouteBase>[
              GoRoute(
                name: 'article',
                path: 'article/:id',
                builder: (BuildContext context, GoRouterState state) {
                  return ArticlePage(state.pathParameters['id']!);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
