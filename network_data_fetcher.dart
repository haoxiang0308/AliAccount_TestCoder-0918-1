import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求，添加User-Agent头
    final response = await http.get(
      Uri.parse(url),
      headers: {'User-Agent': 'Dart/3.x Network Data Fetcher'},
    );
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '/workspace/$randomFileName';
      
      // 将数据写入文件
      await File(filePath).writeAsString(response.body);
      
      print('数据已成功保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  }
}

/// 生成随机的.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '${randomString}.dart';
}

/// 示例使用函数
Future<void> exampleUsage() async {
  // 示例URL - 获取一个公开的JSON API
  String url = 'https://httpbin.org/json';
  
  try {
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件保存成功: $savedFilePath');
  } catch (e) {
    print('执行失败: $e');
  }
}

void main() async {
  await exampleUsage();
}