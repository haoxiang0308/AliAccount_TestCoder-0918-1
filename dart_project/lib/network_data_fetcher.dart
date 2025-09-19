import 'dart:convert';
import 'package:http/http.dart' as http;

/// 异步函数，用于从指定URL获取数据。
/// 成功时返回解析后的JSON对象，失败时返回null。
Future<Map<String, dynamic>?> fetchData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // 如果服务器返回成功状态码，则解析JSON。
      return jsonDecode(response.body);
    } else {
      // 如果服务器返回非成功状态码，则打印错误信息。
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    // 捕获并打印网络请求或数据解析中的任何异常。
    print('请求过程中发生错误: $e');
  }
  return null; // 发生任何问题时返回null。
}

/// 主函数，用于演示如何使用fetchData函数。
void main() async {
  // 使用一个公共的测试API端点。
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts/1';
  
  print('正在从 $apiUrl 获取数据...');
  final data = await fetchData(apiUrl);

  if (data != null) {
    print('数据获取成功:');
    print(data);
  } else {
    print('数据获取失败。');
  }
}