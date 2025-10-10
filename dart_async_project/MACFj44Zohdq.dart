// Since the Dart SDK is not available in this environment,
// we will create the file containing the asynchronous function
// and save it with a random name as requested.
// This file represents the code that would perform the async fetch.

import 'dart:convert';
import 'package:http/http.dart' as http;

/// Asynchronously fetches data from a given URL.
Future<Map<String, dynamic>> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // If the server returns a 200 OK response, parse the JSON.
    return json.decode(response.body) as Map<String, dynamic>;
  } else {
    // If the server returns an error, throw an exception.
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}

void main() async {
  try {
    final data = await fetchData('https://jsonplaceholder.typicode.com/todos/1');
    print('Fetched data: $data');
  } catch (e) {
    print('Error: $e');
  }
}