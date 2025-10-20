defmodule CompilerInfo do
  defmacro print_compile_time_info do
    # 获取当前时间戳
    timestamp = DateTime.utc_now()
    # 获取当前模块名
    module = __CALLER__.module
    # 获取当前文件名
    file = __CALLER__.file
    # 获取行号
    line = __CALLER__.line
    
    # 生成随机文件名
    random_name = :crypto.strong_rand_bytes(10) |> Base.encode16() |> String.downcase()
    filename = "/workspace/#{random_name}.ex"
    
    # 准备编译时信息
    info = %{
      module: module,
      file: file,
      line: line,
      compile_time: timestamp,
      random_filename: filename
    }
    
    # 打印编译时信息
    IO.puts("Compiling module: #{inspect(module)}")
    IO.puts("File: #{file}")
    IO.puts("Line: #{line}")
    IO.puts("Compile time: #{DateTime.to_string(timestamp)}")
    IO.puts("Generated random file: #{filename}")
    
    # 将信息写入随机命名的.ex文件
    content = """
    # Generated at compile time: #{DateTime.to_string(timestamp)}
    # Module: #{inspect(module)}
    # File: #{file}
    # Line: #{line}

    defmodule GeneratedInfo_#{random_name} do
      def compile_info do
        %{
          module: #{inspect(module)},
          file: #{inspect(file)},
          line: #{line},
          compile_time: #{inspect(timestamp)},
          random_filename: #{inspect(filename)}
        }
      end
    end
    """
    
    File.write!(filename, content)
    
    quote do
      IO.puts("Compile-time info macro executed in #{unquote(module)}")
    end
  end
end