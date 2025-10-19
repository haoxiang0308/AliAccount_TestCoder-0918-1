import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：从网络获取数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url, {String? directory}) async {
  try {
    // 使用http包获取网络数据
    http.Response response = await http.get(Uri.parse(url));
    
    if (response.statusCode != 200) {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
    
    String data = response.body;
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    
    // 确定保存目录
    String saveDirectory = directory ?? Directory.current.path;
    
    // 创建完整文件路径
    String filePath = '$saveDirectory/$randomFileName';
    
    // 将数据写入文件
    File file = File(filePath);
    await file.writeAsString(data);
    
    print('数据已保存到: $filePath');
    return filePath;
  } catch (e) {
    print('错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  
  return '${randomString}_data.dart';
}

/// 使用示例
Future<void> main() async {
  try {
    // 示例：获取一个公共API的数据
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('成功获取并保存数据到文件: $savedFilePath');
  } catch (e) {
    print('程序执行失败: $e');
  }
}