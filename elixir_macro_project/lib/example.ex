defmodule Example do
  require MacroPrinter

  # 使用宏打印编译时信息
  compile_info = MacroPrinter.print_compile_time_info(__MODULE__)

  def hello do
    IO.puts("Hello from Example module!")
    compile_info
  end
end