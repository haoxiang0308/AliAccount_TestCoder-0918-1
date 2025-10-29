# Elixir宏：编译时信息打印器 - 项目完成说明

## 项目概述

已完成一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 完成的文件

1. `elixir_macro_project/mix.exs` - Elixir项目配置文件
2. `elixir_macro_project/lib/macro_printer.ex` - 包含宏定义的模块
3. `elixir_macro_project/lib/example.ex` - 使用宏的示例模块
4. `elixir_macro_project/README.md` - 详细文档
5. `elixir_macro_project/test_macro.exs` - 模拟宏行为的测试脚本

## 宏功能

`MacroPrinter.print_compile_time_info/1` 宏具有以下功能：

1. 在编译时收集信息（模块名、文件路径、行号、时间戳、节点信息、Elixir版本、OTP版本）
2. 生成一个随机命名的.ex文件
3. 将编译时信息保存到该文件中
4. 在编译时打印信息到控制台

## 技术细节

- 使用 `__CALLER__` 获取编译时上下文信息
- 使用 `:crypto.strong_rand_bytes/1` 生成安全的随机文件名
- 使用 `quote` 和 `unquote` 实现宏的代码生成
- 在编译时执行文件写入操作

## 文件结构

生成的随机命名文件包含格式化的编译时信息，便于后续分析和调试。

## 注意

由于环境限制，无法安装Elixir进行实际测试，但所有代码都已按照Elixir语法编写，并在README中提供了详细说明。