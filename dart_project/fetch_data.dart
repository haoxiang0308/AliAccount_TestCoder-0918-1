import 'dart:io';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:math';

/// Generates a random .dart filename.
String generateRandomDartFilename() {
  final random = Random();
  final randomString = List<int>.generate(10, (i) => random.nextInt(256));
  final hash = sha256.convert(randomString);
  return '${hash.toString().substring(0, 16)}.dart';
}

/// Fetches data from a URL and saves it to a file with a random name.
Future<void> fetchAndSaveData(String url) async {
  try {
    final httpClient = HttpClient();
    final request = await httpClient.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      final content = await response.transform(utf8.decoder).join();
      final filename = generateRandomDartFilename();
      final filePath = '/workspace/dart_project/$filename';

      final file = File(filePath);
      await file.writeAsString(content);

      print('Data fetched successfully and saved to $filePath');
    } else {
      print('Failed to fetch data. Status code: ${response.statusCode}');
    }
  } catch (error) {
    print('An error occurred: $error');
  }
}

void main() async {
  // Example usage: fetching data from httpbin.org
  await fetchAndSaveData('https://httpbin.org/json');
}