import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

/// 异步函数，获取网络数据并保存到随机命名的.dart文件中
Future<void> fetchAndSaveData() async {
  const String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';
  const String outputDir = '/workspace/dart_async_project/output';

  try {
    print('正在从 $apiUrl 获取数据...');
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      print('数据获取成功。');
      final data = json.decode(response.body);

      // 创建输出目录（如果不存在）
      await Directory(outputDir).create(recursive: true);

      // 生成随机文件名
      final randomFileName = 'data_${DateTime.now().millisecondsSinceEpoch}.dart';
      final filePath = '$outputDir/$randomFileName';

      print('正在将数据写入文件 $filePath ...');
      final file = File(filePath);
      await file.writeAsString('''
// Generated file: $randomFileName
// Fetched from: $apiUrl
// At: ${DateTime.now().toIso8601String()}

const Map<String, dynamic> fetchedData = $data;
''');

      print('数据已成功保存到 $filePath');
    } else {
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
  }
}

void main() async {
  await fetchAndSaveData();
}