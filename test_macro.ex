defmodule TestModule do
  require CompilerInfo
  
  # 使用宏
  CompilerInfo.print_compile_time_info()
  
  def test_function do
    "This is a test function"
  end
end