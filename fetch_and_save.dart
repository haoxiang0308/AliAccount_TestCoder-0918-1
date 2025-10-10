import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 异步函数：从指定URL获取JSON数据
Future<Map<String, dynamic>?> fetchData(String url) async {
  try {
    final response = await HttpClient().getUrl(Uri.parse(url));
    final data = await response.close();
    final body = await data.transform(utf8.decoder).join();
    return jsonDecode(body) as Map<String, dynamic>;
  } catch (e) {
    print('获取数据时发生错误: $e');
    return null;
  }
}

/// 生成随机的 Dart 文件名
String generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  final buffer = StringBuffer();
  for (int i = 0; i < 10; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  return '${buffer.toString()}.dart';
}

void main() async {
  // 示例URL，获取一个虚拟的用户信息
  const url = 'https://jsonplaceholder.typicode.com/users/1';
  print('正在从 $url 获取数据...');

  final data = await fetchData(url);
  if (data != null) {
    final fileName = generateRandomFileName();
    print('将数据保存到文件: $fileName');

    // 将获取的数据转换为Dart代码字符串
    final fileContent = '''
// Generated file: $fileName
// Data fetched from: $url
const fetchedData = ${jsonEncode(data)};
''';

    await File(fileName).writeAsString(fileContent);
    print('数据已成功保存到 $fileName');
  } else {
    print('未能获取数据，无法创建文件。');
  }
}