defmodule CompileInfoMacro do
  @moduledoc """
  定义一个宏来打印编译时信息并保存到随机命名的.ex文件中
  """

  defmacro print_compile_info(module_name \\ nil) do
    # 获取当前时间戳
    timestamp = DateTime.utc_now() |> DateTime.to_iso8601()
    
    # 生成随机文件名
    random_suffix = :crypto.strong_rand_bytes(8) |> Base.encode16(case: :lower)
    filename = "compile_info_#{random_suffix}.ex"
    
    # 获取当前模块信息
    module = 
      case module_name do
        nil -> __CALLER__.module
        _ -> module_name
      end

    # 获取文件路径和行号
    file = __CALLER__.file
    line = __CALLER__.line

    # 构建编译时信息
    compile_info = %{
      module: module,
      file: file,
      line: line,
      timestamp: timestamp,
      node: Node.self(),
      elixir_version: System.version(),
      otp_version: System.otp_release()
    }

    # 打印编译时信息到控制台
    IO.puts("=== 编译时信息 ===")
    IO.puts("模块: #{inspect(compile_info.module)}")
    IO.puts("文件: #{compile_info.file}")
    IO.puts("行号: #{compile_info.line}")
    IO.puts("时间戳: #{compile_info.timestamp}")
    IO.puts("节点: #{inspect(compile_info.node)}")
    IO.puts("Elixir版本: #{compile_info.elixir_version}")
    IO.puts("OTP版本: #{compile_info.otp_version}")
    IO.puts("==================")

    # 将编译时信息写入随机命名的文件
    file_content = """
    # 编译时信息
    # 生成时间: #{compile_info.timestamp}
    
    %{
      module: #{inspect(compile_info.module)},
      file: #{inspect(compile_info.file)},
      line: #{compile_info.line},
      timestamp: #{inspect(compile_info.timestamp)},
      node: #{inspect(compile_info.node)},
      elixir_version: #{inspect(compile_info.elixir_version)},
      otp_version: #{inspect(compile_info.otp_version)}
    }
    """

    File.write!(filename, file_content)
    IO.puts("编译时信息已保存到文件: #{filename}")

    # 返回一个简单的值，因为宏需要返回有效的Elixir语法
    quote do
      unquote("Compile info saved to #{filename}")
    end
  end
end

# 使用示例
defmodule ExampleModule do
  use CompileInfoMacro
  
  # 调用宏来打印编译时信息
  CompileInfoMacro.print_compile_info(__MODULE__)
  
  def hello do
    "world"
  end
end