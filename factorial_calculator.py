import random
import string
import os

def factorial(n):
    """
    计算给定数字的阶乘
    :param n: 非负整数
    :return: n的阶乘
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def save_factorial_function_to_random_file():
    """
    将阶乘函数保存到一个随机命名的Python文件中
    """
    # 创建包含阶乘函数的代码字符串
    factorial_code = '''def factorial(n):
    """
    计算给定数字的阶乘
    :param n: 非负整数
    :return: n的阶乘
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result
'''
    
    # 生成随机文件名
    random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
    
    # 写入文件
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(factorial_code)
    
    print(f"阶乘函数已保存到文件: {random_filename}")
    return random_filename

# 示例用法
if __name__ == "__main__":
    # 测试阶乘函数
    print("计算5的阶乘:", factorial(5))
    print("计算0的阶乘:", factorial(0))
    print("计算10的阶乘:", factorial(10))
    
    # 保存阶乘函数到随机命名的文件
    saved_file = save_factorial_function_to_random_file()
    
    # 验证文件是否创建成功
    if os.path.exists(saved_file):
        print(f"文件 {saved_file} 创建成功！")
        # 显示文件内容
        with open(saved_file, 'r', encoding='utf-8') as f:
            print(f"\n文件内容:\n{f.read()}")