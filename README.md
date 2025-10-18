# Elixir宏：打印编译时信息并保存到随机命名的.ex文件中

## 说明

这个项目包含了一个Elixir宏的实现，用于在编译时收集和保存信息。由于系统中没有安装Elixir，我提供了两种实现：

1. Elixir代码实现（`compiler_info_macro.ex`）
2. Python模拟实现（`compiler_info_macro_simulator.py`）

## Elixir实现

`compiler_info_macro.ex` 文件包含以下功能：

- `print_compile_time_info/0` 宏：收集当前编译时的上下文信息，包括：
  - 文件名
  - 当前模块
  - 当前函数
  - 行号
  - 时间戳
  
- 将收集的信息打印到控制台
- 将信息保存到随机命名的.ex文件中（格式：`compile_info_[随机数].ex`）

## Python模拟实现

`compiler_info_macro_simulator.py` 文件模拟了Elixir宏的行为：

- 模拟了宏收集编译时信息的功能
- 生成随机命名的.ex文件
- 保存收集到的信息

## 运行结果

当运行Python模拟器时，它会：
1. 打印编译时信息到控制台
2. 生成一个随机命名的.ex文件（如：`compile_info_477126.ex`）
3. 将相同的信息保存到该文件中

## 文件结构

- `compiler_info_macro.ex` - Elixir宏的原始实现
- `compiler_info_macro_simulator.py` - Python模拟实现
- `compile_info_[随机数].ex` - 生成的包含编译时信息的文件
- `README.md` - 当前说明文档