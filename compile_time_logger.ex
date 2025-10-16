defmodule CompileTimeLogger do
  @moduledoc """
  定义一个宏用于在编译时打印信息并保存到随机命名的.ex文件中
  """

  defmacro log_and_save(message) do
    # 生成随机文件名
    random_filename = 
      :crypto.strong_rand_bytes(10)
      |> Base.encode16(case: :lower)
      |> Kernel.<>(".ex")
    
    # 编译时获取信息
    compile_info = %{
      message: message,
      file: __CALLER__.file,
      line: __CALLER__.line,
      timestamp: DateTime.utc_now() |> DateTime.to_string()
    }
    
    # 打印编译时信息
    IO.puts("Compile-time log: #{message}")
    IO.puts("File: #{__CALLER__.file}:#{__CALLER__.line}")
    IO.puts("Timestamp: #{compile_info.timestamp}")
    IO.puts("Saved to: #{random_filename}")
    IO.puts("---")
    
    # 将信息保存到随机命名的.ex文件
    file_content = """
    # Compile-time log file
    # Generated at: #{compile_info.timestamp}
    # Source: #{compile_info.file}:#{compile_info.line}
    
    defmodule CompileTimeLog do
      def message, do: #{inspect(compile_info.message)}
      def source_file, do: #{inspect(compile_info.file)}
      def source_line, do: #{inspect(compile_info.line)}
      def timestamp, do: #{inspect(compile_info.timestamp)}
    end
    """
    
    File.write(random_filename, file_content)
    
    # 返回一个简单的表达式
    quote do
      unquote(message)
    end
  end
end