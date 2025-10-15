defmodule CompileTimeLogger do
  @moduledoc """
  A module that provides a macro to print and save compile-time information.
  """

  defmacro log_compile_info(message) do
    timestamp = DateTime.utc_now()
    random_suffix = :rand.uniform(1000000) |> Integer.to_string()
    filename = "compile_info_#{random_suffix}.ex"

    # 获取调用上下文信息
    caller_file = __CALLER__.file
    caller_line = __CALLER__.line
    caller_module = __CALLER__.module
    caller_function = __CALLER__.function

    # 打印编译时信息
    IO.puts("Compile-time info: message=#{inspect(message)}, file=#{caller_file}, line=#{caller_line}, module=#{inspect(caller_module)}, function=#{inspect(caller_function)}, timestamp=#{DateTime.to_iso8601(timestamp)}")

    # 将信息保存到随机命名的.ex文件中
    File.write!(filename, """
    # Compile-time information generated at: #{DateTime.to_iso8601(timestamp)}
    # Source file: #{caller_file}
    # Line: #{caller_line}
    # Module: #{inspect(caller_module)}
    # Function: #{inspect(caller_function)}
    
    %{
      message: #{inspect(message)},
      file: #{inspect(caller_file)},
      line: #{caller_line},
      module: #{inspect(caller_module)},
      function: #{inspect(caller_function)},
      timestamp: #{inspect(timestamp)}
    }
    """)

    IO.puts("Compile-time info saved to #{filename}")

    # 返回原始表达式，这样它不会影响代码的执行
    quote do
      unquote(message)
    end
  end
end

# 示例使用
defmodule TestModule do
  require CompileTimeLogger

  CompileTimeLogger.log_compile_info("This is a test message")

  def test_function do
    CompileTimeLogger.log_compile_info("Inside test function")
    :ok
  end
end