def factorial(n):
    """
    计算非负整数 n 的阶乘。
    
    参数:
    n (int): 非负整数
    
    返回:
    int: n 的阶乘值
    
    异常:
    ValueError: 如果 n 是负数则抛出异常
    """
    if n < 0:
        raise ValueError("阶乘不能计算负数")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# 示例用法
if __name__ == "__main__":
    try:
        number = 5
        print(f"{number}! = {factorial(number)}")
    except ValueError as e:
        print(f"错误: {e}")
