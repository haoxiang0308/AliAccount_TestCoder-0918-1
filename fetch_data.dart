import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> fetchAndSaveData() async {
  try {
    final response = await http.get(Uri.parse('https://api.github.com/users/octocat'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final jsonString = JsonEncoder.withIndent('  ').convert(data);
      final fileName = 'data_${DateTime.now().millisecondsSinceEpoch}.dart';
      final file = File(fileName);
      await file.writeAsString('const String apiData = r\'\'\'\n$jsonString\n\'\'\';\n');
      print('Data saved to $fileName');
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}