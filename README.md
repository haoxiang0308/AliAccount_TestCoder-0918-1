# Elixir 编译时信息宏

这个项目包含一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 功能

- 定义了一个名为 `print_compile_info/0` 的宏
- 在编译时获取以下信息：
  - 文件名
  - 模块名
  - 函数名
  - 时间戳
  - 随机数
- 将信息打印到控制台
- 将信息保存到随机命名的.ex文件中

## 文件

- `compile_info_macro.ex` - 包含宏定义和示例用法的主文件
- `compile_info_{timestamp}_{random_number}.ex` - 生成的包含编译时信息的文件

## 使用

运行以下命令来执行宏：

```bash
elixir compile_info_macro.ex
```

这将打印编译时信息到控制台，并生成一个随机命名的.ex文件。