import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发送HTTP GET请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = 'output/$randomFileName';
      
      // 确保输出目录存在
      Directory('output').createSync(recursive: true);
      
      // 将响应数据写入文件
      await File(filePath).writeAsString(response.body);
      
      print('数据已保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  // 生成10个字符的随机字符串
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '${randomString}.dart';
}

void main() async {
  // 示例：获取JSONPlaceholder的用户数据
  String url = 'https://jsonplaceholder.typicode.com/users';
  
  try {
    String savedFilePath = await fetchAndSaveData(url);
    print('成功保存数据到文件: $savedFilePath');
  } catch (e) {
    print('操作失败: $e');
  }
}