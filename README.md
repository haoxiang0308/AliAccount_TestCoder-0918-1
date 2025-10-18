# Elixir 编译时信息宏

这个项目包含一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 文件说明

- `compile_info_macro.ex`: 包含宏定义和使用示例的Elixir文件

## 宏功能

`CompileInfoMacro.print_compile_info/1` 宏提供以下功能：

1. 在编译时获取并打印以下信息：
   - 当前模块名称
   - 源文件路径
   - 行号
   - 时间戳
   - 节点信息
   - Elixir版本
   - OTP版本

2. 将编译时信息保存到随机命名的.ex文件中（格式：`compile_info_[随机字符].ex`）

## 使用方法

```elixir
defmodule YourModule do
  # 引入宏
  require CompileInfoMacro
  
  # 调用宏打印编译时信息
  CompileInfoMacro.print_compile_info(__MODULE__)
  
  # 你的其他代码
  def hello do
    "world"
  end
end
```

## 输出

运行时，宏会在控制台打印类似以下信息：
```
=== 编译时信息 ===
模块: ExampleModule
文件: /path/to/your/file.ex
行号: 10
时间戳: 2023-06-15T10:30:45.123Z
节点: nonode@nohost
Elixir版本: 1.14.0
OTP版本: 25
==================
编译时信息已保存到文件: compile_info_a1b2c3d4e5f6.ex
```

生成的文件将包含结构化的编译时信息，可用于调试或记录目的。