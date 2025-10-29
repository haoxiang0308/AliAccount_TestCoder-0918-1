def factorial(n):
    """
    计算n的阶乘
    
    Args:
        n (int): 非负整数
    
    Returns:
        int: n的阶乘值
    
    Raises:
        ValueError: 当n为负数时抛出异常
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
    print(f"5! = {factorial(5)}")
    print(f"0! = {factorial(0)}")
    print(f"1! = {factorial(1)}")
    print(f"10! = {factorial(10)}")