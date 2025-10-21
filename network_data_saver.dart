import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步获取网络数据并保存到随机命名的.dart文件中
Future<String> fetchAndSaveNetworkData(String url) async {
  try {
    print('正在获取网络数据: $url');
    
    // 发送HTTP请求获取数据
    final response = await http.get(Uri.parse(url));
    
    if (response.statusCode == 200) {
      // 生成随机文件名
      String randomFileName = _generateRandomFileName();
      String filePath = '/workspace/$randomFileName.dart';
      
      // 将数据写入随机命名的.dart文件
      File file = File(filePath);
      await file.writeAsString(response.body);
      
      print('数据已成功保存到: $filePath');
      return filePath;
    } else {
      throw Exception('请求失败: ${response.statusCode}');
    }
  } catch (e) {
    print('发生错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  String chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  String randomString = '';
  
  for (int i = 0; i < 10; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return 'data_$randomString';
}

void main() async {
  // 示例：获取JSONPlaceholder的数据并保存
  String url = 'https://jsonplaceholder.typicode.com/posts/1';
  
  try {
    String savedFilePath = await fetchAndSaveNetworkData(url);
    print('文件保存成功: $savedFilePath');
  } catch (e) {
    print('操作失败: $e');
  }
}