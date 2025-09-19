import 'dart:convert';
import 'package:http/http.dart' as http;

/// 异步函数，用于从指定URL获取数据。
/// 返回一个Future，其结果是解析后的JSON对象。
Future<dynamic> fetchData(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // 如果服务器返回成功状态码，则解析JSON。
    return json.decode(response.body);
  } else {
    // 如果服务器返回错误状态码，则抛出异常。
    throw Exception('Failed to load data: ${response.statusCode}');
  }
}

// 示例main函数，演示如何调用fetchData
void main() async {
  try {
    String url = 'https://jsonplaceholder.typicode.com/posts/1';
    dynamic data = await fetchData(url);
    print('Data fetched successfully:');
    print(data);
  } catch (error) {
    print('Error: $error');
  }
}