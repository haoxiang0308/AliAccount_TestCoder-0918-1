import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// A function to fetch data from a URL and save it to a randomly named .dart file.
Future<void> fetchAndSaveData(String url) async {
  try {
    // Simulate fetching data from the network.
    // In a real scenario, you would use an HTTP client like `package:http`.
    print('Fetching data from $url...');
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    final jsonData = {'fetched_from': url, 'timestamp': DateTime.now().millisecondsSinceEpoch};

    // Convert data to a string representation suitable for a Dart file.
    final fileContent = '''
// Data fetched from $url
// Generated at ${DateTime.now().toIso8601String()}

const Map<String, dynamic> fetchedData = ${jsonEncode(jsonData)};
''';

    // Generate a random file name.
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final randomFileName = StringBuffer();
    for (int i = 0; i < 10; i++) {
      randomFileName.write(chars[random.nextInt(chars.length)]);
    }
    final fileName = '/workspace/dart_async/${randomFileName.toString()}.dart';

    // Write the content to the file.
    final file = File(fileName);
    await file.writeAsString(fileContent);
    print('Data successfully saved to $fileName');

  } catch (e) {
    print('An error occurred: $e');
  }
}

void main() async {
  await fetchAndSaveData('https://api.example.com/data');
}