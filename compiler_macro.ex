defmodule CompilerInfo do
  defmacro print_and_save_compile_info do
    # 获取编译时信息
    compile_time = DateTime.utc_now()
    file_info = __ENV__.file
    module_info = __CALLER__.module
    line_info = __ENV__.line

    # 创建编译时信息字符串
    info = """
    编译时间: #{DateTime.to_string(compile_time)}
    文件路径: #{file_info}
    模块名称: #{inspect(module_info)}
    当前行号: #{line_info}
    节点名称: #{Node.self()}
    Elixir版本: #{System.version()}
    """

    # 生成随机文件名
    random_name = :crypto.strong_rand_bytes(10) |> Base.encode16() |> String.downcase()
    filename = "/workspace/#{random_name}.ex"

    # 将信息保存到随机命名的文件中
    File.write!(filename, info)

    # 打印编译时信息
    IO.puts("编译时信息已保存到文件: #{filename}")
    IO.puts(info)

    # 返回一个简单的值，因为宏必须返回有效的Elixir语法
    quote do
      unquote(filename)
    end
  end
end