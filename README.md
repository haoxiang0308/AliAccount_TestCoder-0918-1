# Elixir 编译时信息宏

这个项目定义了一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 功能特点

- 在编译时捕获并打印当前上下文信息
- 生成随机命名的文件以保存编译时信息
- 提供以下信息：
  - 描述文本
  - 文件路径
  - 行号
  - 模块名
  - 函数名
  - 时间戳

## 文件说明

- `compile_info_macro.ex` - 宏定义文件
- `test_macro.exs` - 初步测试脚本
- `example_usage.exs` - 使用示例脚本
- 多个 `compile_info_*.ex` - 随机生成的编译时信息文件

## 使用方法

1. 在模块中导入宏：
   ```elixir
   import CompileInfoMacro
   ```

2. 在函数或宏中使用：
   ```elixir
   def my_function do
     print_compile_info("我的函数编译信息")
     # 函数体
   end
   ```

## 编译时 vs 运行时

- 宏在编译时执行，此时会打印信息并保存到文件
- 编译时信息包括定义位置的上下文信息
- 运行时只执行宏扩展后的代码

## 示例输出

当编译包含宏调用的代码时，会看到类似以下的输出：

```
=== 编译时信息 ===
描述: 示例函数的编译信息
文件: /workspace/test_macro.exs
行号: 9
模块: ExampleModule
函数: :example_function
时间戳: 2025-10-19 02:04:25.974519Z
信息已保存到: compile_info_543dc6b16de15a4440dc.ex
==================
```

同时，会创建一个随机命名的.ex文件，内容为Elixir映射（map），包含所有编译时信息。