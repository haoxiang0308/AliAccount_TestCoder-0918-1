import 'dart:convert';
import 'package:http/http.dart' as http;

/// 异步函数，用于从指定URL获取数据。
/// 成功时返回解析后的JSON数据，失败时返回null。
Future<Map<String, dynamic>?> fetchData(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // 如果服务器返回成功状态码，则解析JSON
      return jsonDecode(response.body);
    } else {
      // 如果服务器返回错误状态码，则打印错误信息
      print('请求失败，状态码: ${response.statusCode}');
      return null;
    }
  } catch (e) {
    // 捕获并打印网络或其他错误
    print('请求异常: $e');
    return null;
  }
}

// 示例主函数，演示如何使用fetchData函数
Future<void> main() async {
  final String url = 'https://api.github.com/repos/dart-lang/sdk';
  final data = await fetchData(url);

  if (data != null) {
    print('仓库名称: ${data['name']}');
    print('描述: ${data['description']}');
  } else {
    print('获取数据失败');
  }
}