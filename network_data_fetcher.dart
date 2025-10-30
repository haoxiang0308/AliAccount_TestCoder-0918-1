import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
/// 
/// [url] - 要获取数据的网络地址
/// [directory] - 保存文件的目录路径，默认为当前工作目录
/// 返回生成的文件名
Future<String> fetchAndSaveNetworkData(String url, {String directory = '.'}) async {
  try {
    // 使用http包进行网络请求
    http.Response response = await http.get(Uri.parse(url));
    
    // 检查响应状态
    if (response.statusCode != 200) {
      throw Exception('HTTP请求失败，状态码: ${response.statusCode}');
    }
    
    // 获取响应数据
    String data = response.body;
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    String filePath = '$directory/$randomFileName.dart';
    
    // 将数据写入文件
    File file = File(filePath);
    await file.writeAsString(data);
    
    print('数据已成功保存到: $filePath');
    return randomFileName;
  } catch (e) {
    print('获取或保存数据时出错: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  String randomString = '';
  
  // 生成8-12个字符的随机字符串
  int length = 8 + random.nextInt(5);
  for (int i = 0; i < length; i++) {
    randomString += chars[random.nextInt(chars.length)];
  }
  
  return randomString;
}

/// 使用示例
void main() async {
  try {
    // 示例：获取JSONPlaceholder的用户数据
    String fileName = await fetchAndSaveNetworkData(
      'https://jsonplaceholder.typicode.com/users',
      directory: '/workspace'
    );
    print('随机生成的文件名: $fileName.dart');
  } catch (e) {
    print('执行过程中发生错误: $e');
  }
}