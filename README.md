# 网络数据获取和保存程序

这个Dart程序包含一个异步函数，可以从网络获取数据并保存到随机命名的.dart文件中。

## 功能

- `fetchAndSaveNetworkData(url, {directory})`: 异步获取指定URL的数据并保存到随机命名的.dart文件
- `_generateRandomFileName()`: 生成随机的.dart文件名

## 依赖项

要运行此程序，您需要在Dart环境中安装以下依赖项：

```yaml
dependencies:
  http: ^0.13.5
```

## 使用方法

1. 确保已安装Dart SDK
2. 运行 `dart pub get` 安装依赖项
3. 执行程序: `dart network_data_fetcher.dart`

## 代码说明

- 程序使用http包进行网络请求
- 随机文件名生成器创建唯一的.dart文件名
- 数据以原始格式保存到文件中
- 支持自定义保存目录