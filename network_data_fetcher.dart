import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 获取网络数据并保存到随机命名的.dart文件中的异步函数
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在从 $url 获取数据...');
    
    // 发起网络请求
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      
      // 将数据写入文件
      File file = File(randomFileName);
      await file.writeAsString(response.body);
      
      print('数据已保存到: $randomFileName');
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
  
  String randomString = '';
  for (int i = 0; i < 10; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return '${randomString}_data.dart';
}

/// 主函数用于演示
void main() async {
  // 示例：获取一个公共API的数据并保存
  try {
    // 使用一个示例API（JSONPlaceholder）
    String fileName = await fetchAndSaveNetworkData('https://jsonplaceholder.typicode.com/posts/1');
    print('成功保存文件: $fileName');
  } catch (e) {
    print('执行失败: $e');
  }
}