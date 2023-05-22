import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../provider/user_privider.dart';

class UsersScreen extends ConsumerWidget {
  static const String route = '/';
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsyncValue = ref.watch(usersProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: usersAsyncValue.when(
        data: (users) {
          if (users.isEmpty) {
            return Center(
              child: Text('No users found.'),
            );
          } else {
            return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                return Card(
                  child: ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                    onTap: () {
                      final userRoute = '/users/${user['id']}';
                      print(userRoute);
                      GoRouter.of(context).go(userRoute);
                    },
                  ),
                );
              },
            );
          }
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}