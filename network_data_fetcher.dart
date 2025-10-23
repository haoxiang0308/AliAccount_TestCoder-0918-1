import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      
      // 将数据写入随机命名的.dart文件
      File file = File(randomFileName);
      await file.writeAsString(response.body);
      
      print('数据已成功保存到文件: $randomFileName');
      return randomFileName;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '/workspace/${randomString}.dart';
}

/// 主函数示例
void main() async {
  // 示例：获取JSONPlaceholder API的数据
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String savedFileName = await fetchAndSaveNetworkData(url);
    print('文件保存成功: $savedFileName');
    
    // 验证文件内容
    File file = File(savedFileName);
    String content = await file.readAsString();
    print('文件内容预览 (前200字符):');
    print(content.length > 200 ? '${content.substring(0, 200)}...' : content);
  } catch (e) {
    print('执行失败: $e');
  }
}