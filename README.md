# Elixir Compile-Time Logger Macro

这是一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 文件说明

1. `compile_time_logger.ex` - 包含宏定义的模块
2. `example_usage.ex` - 演示如何使用宏的示例文件

## 宏功能说明

`CompileTimeLogger.log_and_save/1` 宏的功能：

1. 在编译时接收一个消息参数
2. 生成一个随机的文件名（使用加密安全的随机字节）
3. 打印编译时信息到控制台，包括：
   - 消息内容
   - 源文件位置
   - 时间戳
   - 生成的随机文件名
4. 创建一个包含编译时信息的新.ex文件
5. 返回原始消息以供正常处理

## 使用方法

```elixir
defmodule Example do
  require CompileTimeLogger
  
  # 使用宏记录编译时信息
  CompileTimeLogger.log_and_save("This is a compile-time message")
  
  def hello do
    "Hello, world!"
  end
  
  # 再次使用宏
  CompileTimeLogger.log_and_save("Another compile-time message")
end
```

## 预期输出

当编译使用此宏的代码时，将在控制台输出类似以下信息：

```
Compile-time log: This is a compile-time message
File: example_usage.ex:5
Timestamp: 2023-06-15 10:30:45.123456Z
Saved to: a1b2c3d4e5.ex
---
Compile-time log: Another compile-time message
File: example_usage.ex:11
Timestamp: 2023-06-15 10:30:45.123789Z
Saved to: f6g7h8i9j0.ex
---
```

同时，会创建类似以下内容的.ex文件：

```elixir
# Compile-time log file
# Generated at: 2023-06-15 10:30:45.123456Z
# Source: example_usage.ex:5

defmodule CompileTimeLog do
  def message, do: "This is a compile-time message"
  def source_file, do: "example_usage.ex"
  def source_line, do: 5
  def timestamp, do: "2023-06-15 10:30:45.123456Z"
end
```

## 宏实现细节

宏使用了Elixir的元编程功能：

- `__CALLER__` 获取调用宏的上下文信息
- `:crypto.strong_rand_bytes/1` 生成加密安全的随机字节
- `quote` 和 `unquote` 实现代码生成
- `File.write/2` 在编译时写入文件