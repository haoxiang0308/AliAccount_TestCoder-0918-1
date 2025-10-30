#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

// C++模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名的辅助函数
std::string generateRandomFileName(const std::string& extension = ".cpp") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 9);
    
    std::string filename = "random_";
    
    // 使用时间作为基础生成随机名
    auto time_now = std::time(nullptr);
    filename += std::to_string(time_now) + "_";
    
    // 添加额外的随机数字以增加唯一性
    for(int i = 0; i < 6; i++) {
        filename += std::to_string(dis(gen));
    }
    
    filename += extension;
    return filename;
}

int main() {
    // 演示模板函数的使用
    int x = 10, y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;
    
    double a = 3.14, b = 2.71;
    std::cout << "交换前: a = " << a << ", b = " << b << std::endl;
    swap(a, b);
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl;
    
    std::string str1 = "Hello", str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    // 将此代码保存到随机命名的文件中
    std::string randomFileName = generateRandomFileName(".cpp");
    std::cout << "代码已保存到文件: " << randomFileName << std::endl;
    
    return 0;
}
