# 引入宏定义
defmodule Example do
  require CompileTimeLogger
  
  # 使用宏记录编译时信息
  CompileTimeLogger.log_and_save("This is a compile-time message")
  
  def hello do
    "Hello, world!"
  end
  
  # 再次使用宏
  CompileTimeLogger.log_and_save("Another compile-time message")
end