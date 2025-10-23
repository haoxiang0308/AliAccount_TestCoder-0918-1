# Dart 网络数据获取器

这个项目包含一个Dart异步函数，用于获取网络数据并保存到随机命名的.dart文件中。

## 文件说明

- `network_data_fetcher.dart` - 主要的Dart程序文件，包含异步网络请求和文件保存功能
- `pubspec.yaml` - Dart项目的依赖配置文件

## 功能特点

- 异步获取网络数据
- 生成随机文件名保存数据
- 错误处理机制
- 包含示例用法

## 使用方法

1. 确保已安装Dart SDK
2. 运行以下命令获取依赖：
   ```bash
   dart pub get
   ```
3. 运行程序：
   ```bash
   dart network_data_fetcher.dart
   ```

## 代码说明

`fetchAndSaveNetworkData`函数接收一个URL参数，异步获取该URL的数据，并将其保存到一个随机命名的.dart文件中。随机文件名由`_generateRandomFileName`函数生成，确保文件名的唯一性。

主函数中包含了一个示例，演示如何使用该功能从JSONPlaceholder API获取数据。