import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// Fetches data from a public API and saves it to a randomly named .dart file.
Future<void> fetchDataAndSave() async {
  try {
    // Example API: JSONPlaceholder
    final url = 'https://jsonplaceholder.typicode.com/todos/1';
    final client = HttpClient();
    final request = await client.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == 200) {
      final responseBody = await response.transform(utf8.decoder).join();
      print('Data fetched successfully: $responseBody');

      // Generate a random filename
      final random = Random();
      final randomName = 'fetched_data_${random.nextInt(10000)}.dart';
      final file = File(randomName);

      // Write the data to the file
      await file.writeAsString(responseBody);
      print('Data saved to $randomName');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }

    client.close();
  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchDataAndSave();
}