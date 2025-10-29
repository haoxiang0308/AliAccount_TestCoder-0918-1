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