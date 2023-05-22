import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:first_app/screens/users_screen.dart';

import '../screens/users_detail.dart';

GoRouter createRouter() {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage(
          child: UsersScreen(),
        ),
      ),
      GoRoute(
        path: '/users/:id',
        pageBuilder: (context, state) {
          final id = state.pathParameters['id'];
          return MaterialPage(child: UserDetailScreen(id: int.parse(id!)));
        },
      ),
    ],
  );
}
