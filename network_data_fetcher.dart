import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 获取网络数据并保存到随机命名的.dart文件中的异步函数
Future<String> fetchNetworkDataAndSave(String url) async {
  try {
    // 使用http包获取网络数据
    http.Response response = await http.get(Uri.parse(url));
    
    // 检查响应状态
    if (response.statusCode != 200) {
      throw Exception('获取数据失败，状态码: ${response.statusCode}');
    }
    
    String responseBody = response.body;
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    
    // 将数据写入随机命名的.dart文件
    File file = File(randomFileName);
    await file.writeAsString(responseBody);
    
    print('数据已保存到: $randomFileName');
    return randomFileName;
  } catch (e) {
    print('获取网络数据时发生错误: $e');
    rethrow;
  }
}

/// 生成随机.dart文件名
String _generateRandomFileName() {
  var random = Random();
  String chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  String randomString = List.generate(10, (index) => chars[random.nextInt(chars.length)]).join();
  return '/workspace/${randomString}.dart';
}

/// 使用示例
void main() async {
  // 示例：获取JSONPlaceholder的API数据
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String fileName = await fetchNetworkDataAndSave(url);
    print('成功保存文件: $fileName');
  } catch (e) {
    print('操作失败: $e');
  }
}