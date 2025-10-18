# Elixir Compile Info Macro

This project contains an Elixir macro that prints compile-time information and saves it to a randomly named `.ex` file.

## Features

- Captures compile-time information including:
  - Compile timestamp
  - Current module
  - File and line number where macro is called
  - Node information
  - Elixir version
  - Operating system type
- Saves information to a randomly named file with format: `compile_info_[random_suffix].ex`
- Prints information to console during compilation

## Usage

To use this macro:

1. Create a file with the macro definition:

```elixir
defmodule CompileInfoMacro do
  defmacro print_compile_info() do
    # 获取当前编译时间
    compile_time = DateTime.utc_now()
    
    # 获取当前模块信息（如果在模块中调用）
    module_info = 
      case __CALLER__.module do
        nil -> "No module context"
        mod -> to_string(mod)
      end
    
    # 获取文件名和行号
    file = __CALLER__.file
    line = __CALLER__.line
    
    # 创建编译信息字符串
    info = """
    Compile Time: #{DateTime.to_string(compile_time)}
    Module: #{module_info}
    File: #{file}
    Line: #{line}
    Node: #{node()}
    Elixir Version: #{System.version()}
    OS: #{:os.type()}
    """
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16() |> String.downcase()
    filename = "compile_info_#{random_suffix}.ex"
    
    # 将信息保存到文件
    File.write!(filename, info)
    
    # 打印信息到控制台
    IO.puts("Compile-time information saved to: #{filename}")
    IO.puts(info)
    
    # 返回nil，因为宏只是用于副作用
    quote do
      nil
    end
  end
end

# 示例用法
defmodule ExampleModule do
  require CompileInfoMacro
  
  # 在编译时调用宏
  CompileInfoMacro.print_compile_info()
  
  def example_function do
    "This is an example function"
  end
end
```

2. Compile the file using Elixir:

```bash
elixirc compile_info_macro.ex
```

This will create a random-named file containing the compile-time information.

## Installation

To run this code, you need Elixir installed. You can install it with:

```bash
# On Ubuntu/Debian
curl -fsSL https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb -o erlang-solutions.deb
sudo dpkg -i erlang-solutions.deb
sudo apt update
sudo apt install -y esl-erlang elixir

# On macOS with Homebrew
brew install elixir

# Using asdf version manager
asdf install elixir latest
```