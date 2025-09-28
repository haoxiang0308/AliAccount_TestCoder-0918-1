import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// Fetches data from a URL and saves it to a randomly named .dart file.
Future<void> fetchAndSaveData(String url) async {
  try {
    print('Fetching data from $url...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // Generate a random filename
      final random = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'fetched_data_$random.dart';
      print('Data fetched successfully. Saving to $fileName...');

      // Write the response body to the file
      final file = File(fileName);
      await file.writeAsString(response.body);
      print('Data saved successfully to ${file.absolute.path}');
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('An error occurred: $e');
    rethrow; // Re-throw to allow caller to handle it if needed
  }
}
