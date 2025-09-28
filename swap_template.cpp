#include <iostream>

// 模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // 示例：交换两个整数
    int x = 5, y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 示例：交换两个字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    return 0;
}