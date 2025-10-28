defmodule TestModule do
  require CompilerInfo

  # 使用宏打印编译时信息并保存到随机命名的.ex文件中
  CompilerInfo.print_and_save_compile_info()
  
  def test_function do
    IO.puts("这是一个测试函数")
  end
end