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