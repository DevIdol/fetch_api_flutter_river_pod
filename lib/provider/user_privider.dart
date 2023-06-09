import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final usersProvider = FutureProvider<List<dynamic>>((ref) async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  final jsonData = jsonDecode(response.body) as List<dynamic>;
  return jsonData;
});

final userDetailsProvider =
    FutureProvider.family<dynamic, int>((ref, id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/users/$id'));
  final jsonData = jsonDecode(response.body);
  return jsonData;
});
