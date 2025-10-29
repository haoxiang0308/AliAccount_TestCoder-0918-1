# Elixir 宏 - 编译时信息打印器

本项目定义了一个Elixir宏，用于在编译时打印信息并将其保存到随机命名的.ex文件中。

## 宏定义

`MacroPrinter.print_compile_time_info/1` 宏具有以下功能：

1. 收集编译时信息（模块名、文件路径、行号、时间戳、节点信息、Elixir版本、OTP版本）
2. 生成一个随机命名的.ex文件
3. 将编译时信息保存到该文件中
4. 在编译时打印信息到控制台

## 代码结构

### MacroPrinter 模块 (`lib/macro_printer.ex`)

```elixir
defmodule MacroPrinter do
  @moduledoc """
  定义一个宏来打印编译时信息并将其保存到随机命名的.ex文件中
  """

  defmacro print_compile_time_info(module_name) do
    # 获取编译时信息
    compile_info = %{
      module: module_name,
      file: __CALLER__.file,
      line: __CALLER__.line,
      timestamp: DateTime.utc_now() |> DateTime.to_string(),
      node: Node.self(),
      elixir_version: System.version(),
      otp_version: System.otp_release()
    }

    # 生成随机文件名
    random_filename = 
      :crypto.strong_rand_bytes(10)
      |> Base.encode16()
      |> String.downcase()
      |> Kernel.<>(".ex")

    # 创建文件内容
    file_content = """
    # 编译时信息
    # 模块: #{inspect(compile_info.module)}
    # 文件: #{compile_info.file}
    # 行号: #{compile_info.line}
    # 时间戳: #{compile_info.timestamp}
    # 节点: #{compile_info.node}
    # Elixir版本: #{compile_info.elixir_version}
    # OTP版本: #{compile_info.otp_version}

    # 生成的编译时信息数据
    compile_time_info = unquote(Macro.escape(compile_info))
    """

    # 将信息写入随机命名的文件
    File.write(random_filename, file_content)

    quote do
      IO.puts("编译时信息:")
      IO.puts("  模块: #{inspect(unquote(module_name))}")
      IO.puts("  文件: #{unquote(__CALLER__.file)}")
      IO.puts("  行号: #{unquote(__CALLER__.line)}")
      IO.puts("  时间戳: #{DateTime.utc_now() |> DateTime.to_string()}")
      IO.puts("  随机文件名: #{unquote(random_filename)}")
      IO.puts("  文件已保存到: #{File.cwd!()}/#{unquote(random_filename)}")
      
      # 返回编译时信息结构
      unquote(Macro.escape(compile_info))
    end
  end
end
```

### 使用示例 (`lib/example.ex`)

```elixir
defmodule Example do
  require MacroPrinter

  # 使用宏打印编译时信息
  compile_info = MacroPrinter.print_compile_time_info(__MODULE__)

  def hello do
    IO.puts("Hello from Example module!")
    compile_info
  end
end
```

## 功能说明

1. **编译时执行**: 宏在编译时执行，而不是运行时
2. **信息收集**: 收集模块名、文件路径、行号、时间戳等信息
3. **随机文件名生成**: 使用`:crypto.strong_rand_bytes/1`生成安全的随机字节，然后转换为十六进制字符串作为文件名
4. **文件保存**: 将收集到的信息保存到随机命名的.ex文件中
5. **控制台输出**: 在编译时将信息打印到控制台

## 编译时行为

当编译使用此宏的模块时，将发生以下事件：
1. 宏在编译时被展开
2. 收集当前编译上下文的信息
3. 生成一个随机文件名（例如：`a1b2c3d4e5.ex`）
4. 将编译时信息写入该文件
5. 在编译输出中显示信息摘要

## 生成的文件内容格式

生成的随机命名.ex文件将包含以下格式的信息：

```
# 编译时信息
# 模块: Example
# 文件: /path/to/example.ex
# 行号: 3
# 时间戳: 2023-01-01T12:00:00Z
# 节点: nonode@nohost
# Elixir版本: 1.14.0
# OTP版本: 25

# 生成的编译时信息数据
compile_time_info = %{...}
```

## 使用方法

1. 在您的模块中 `require MacroPrinter`
2. 调用 `MacroPrinter.print_compile_time_info(__MODULE__)` 来使用宏
3. 编译模块时，将生成随机命名的.ex文件并输出编译信息

## 注意事项

- 宏在编译时执行，因此它会影响编译过程
- 生成的随机文件名确保不会与其他文件冲突
- 生成的文件保存在编译时的工作目录中