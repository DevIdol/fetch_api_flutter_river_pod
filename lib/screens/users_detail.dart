import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/user_privider.dart';

class UserDetailScreen extends ConsumerWidget {
  final int id;

  UserDetailScreen({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsyncValue = ref.watch(userDetailsProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: userAsyncValue.when(
        data: (user) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${user['name']}'),
              Text('Username: ${user['username']}'),
              Text('Email: ${user['email']}'),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}
