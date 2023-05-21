import 'package:first_app/provider/user_privider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final usersAsyncValue = ref.watch(usersProvider);
          return usersAsyncValue.when(
            data: (users) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return ListTile(
                    title: Text(user['name']),
                    subtitle: Text(user['email']),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(user['name']),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Username: ${user['username']}'),
                                Text('Phone: ${user['phone']}'),
                                Text('Website: ${user['website']}'),
                                Text('Address:'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Street: ${user['address']['street']}'),
                                      Text(
                                          'Suite: ${user['address']['suite']}'),
                                      Text('City: ${user['address']['city']}'),
                                      Text(
                                          'Zipcode: ${user['address']['zipcode']}'),
                                      Text('Geo:'),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                'Lat: ${user['address']['geo']['lat']}'),
                                            Text(
                                                'Lng: ${user['address']['geo']['lng']}'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text('Company:'),
                                Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Name: ${user['company']['name']}'),
                                      Text(
                                          'Catch Phrase: ${user['company']['catchPhrase']}'),
                                      Text('Bs: ${user['company']['bs']}'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Close'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Text('Error: $error'),
          );
        },
      ),
    );
  }
}
