import datetime
import random
import os

def print_compile_time_info(file_name, module_name, function_name, line_number):
    """
    模拟Elixir宏的行为，打印编译时信息并保存到随机命名的.ex文件中
    """
    # 获取当前时间戳
    timestamp = datetime.datetime.utcnow()
    # 生成随机文件名
    random_suffix = random.randint(1, 1000000)
    filename = f"compile_info_{random_suffix}.ex"

    # 收集编译时信息
    compile_info = {
        'file': file_name,
        'module': module_name,
        'function': function_name,
        'line': line_number,
        'timestamp': timestamp
    }

    # 打印编译时信息
    print("编译时信息:")
    print(f"文件: {compile_info['file']}")
    print(f"模块: {compile_info['module']}")
    print(f"函数: {compile_info['function']}")
    print(f"行号: {compile_info['line']}")
    print(f"时间戳: {compile_info['timestamp']}")

    # 将信息保存到随机命名的文件中
    content = f"""
# 编译时信息
# 生成时间: {compile_info['timestamp']}
%{{
  file: {repr(compile_info['file'])},
  module: {repr(compile_info['module'])},
  function: {repr(compile_info['function'])},
  line: {compile_info['line']},
  timestamp: {repr(compile_info['timestamp'])}
}}
"""

    with open(filename, 'w', encoding='utf-8') as f:
        f.write(content)
    
    print(f"编译时信息已保存到文件: {filename}")
    
    return compile_info

# 使用示例
def test_function():
    return print_compile_time_info(
        file_name=__file__,
        module_name="TestModule",
        function_name="test_function",
        line_number=42
    )

# 测试模拟宏
result = test_function()
print(f"返回值: {result}")