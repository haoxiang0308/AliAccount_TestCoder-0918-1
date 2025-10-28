import 'dart:convert';
import 'dart:io';
import 'dart:math';

/// 异步函数：获取网络数据并保存到随机命名的.dart文件中
/// 
/// [url] - 要获取数据的网络地址
/// [directory] - 保存文件的目录，默认为当前工作目录
/// 返回生成的文件名
Future<String> fetchAndSaveNetworkData(String url, {String directory = '.'}) async {
  try {
    // 创建HTTP客户端
    HttpClient client = HttpClient();
    
    // 发起GET请求
    Uri uri = Uri.parse(url);
    HttpClientRequest request = await client.getUrl(uri);
    HttpClientResponse response = await request.close();
    
    // 读取响应数据
    String responseBody = await response.transform(utf8.decoder).join();
    
    // 生成随机文件名
    String randomFileName = _generateRandomFileName();
    String filePath = '$directory/$randomFileName.dart';
    
    // 将数据写入文件
    File file = File(filePath);
    await file.writeAsString(responseBody);
    
    // 关闭客户端
    client.close();
    
    print('数据已成功保存到: $filePath');
    return randomFileName;
  } catch (e) {
    print('获取或保存数据时发生错误: $e');
    rethrow;
  }
}

/// 生成随机文件名
String _generateRandomFileName() {
  const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();
  StringBuffer buffer = StringBuffer();
  
  // 生成8位随机字符
  for (int i = 0; i < 8; i++) {
    buffer.write(chars[random.nextInt(chars.length)]);
  }
  
  return buffer.toString();
}

// 示例使用
void main() async {
  try {
    // 示例：获取一个公开API的数据并保存
    // 注意：在实际使用时，请替换为有效的URL
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    String fileName = await fetchAndSaveNetworkData(url);
    print('生成的文件名: $fileName.dart');
  } catch (e) {
    print('主函数执行出错: $e');
  }
}