import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 创建带请求头的请求
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'User-Agent': 'Dart Network Data Fetcher',
        'Accept': 'application/json',
      },
    );
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = generateRandomFileName();
      String filePath = '/workspace/$randomFileName';
      
      // 将数据写入文件
      File file = File(filePath);
      await file.writeAsString(response.body);
      
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

/// 生成随机.dart文件名
String generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // 生成10位随机字符作为文件名
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '${randomString}.dart';
}

void main() async {
  // 示例：获取一个公开API的数据
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件保存成功: $savedFilePath');
  } catch (e) {
    print('程序执行失败: $e');
  }
}