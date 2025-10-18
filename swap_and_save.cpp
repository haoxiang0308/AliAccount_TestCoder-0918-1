#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFilename(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::ostringstream oss;
    oss << "random_" << dis(gen) << extension;
    return oss.str();
}

// 模板函数：交换两个变量并保存到随机命名的文件中
template<typename T>
void swapAndSave(T& a, T& b, const std::string& variableNameA = "varA", const std::string& variableNameB = "varB") {
    std::cout << "交换前: " << variableNameA << " = " << a << ", " << variableNameB << " = " << b << std::endl;
    
    // 交换值
    swap(a, b);
    
    std::cout << "交换后: " << variableNameA << " = " << a << ", " << variableNameB << " = " << b << std::endl;
    
    // 生成随机文件名
    std::string filename = generateRandomFilename(".txt");
    
    // 将结果保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "交换结果:\n";
        file << variableNameA << " = " << a << "\n";
        file << variableNameB << " = " << b << "\n";
        file.close();
        std::cout << "结果已保存到文件: " << filename << std::endl;
    } else {
        std::cerr << "无法创建文件: " << filename << std::endl;
    }
}

int main() {
    // 测试整数交换
    int x = 10, y = 20;
    std::cout << "=== 整数交换测试 ===" << std::endl;
    swapAndSave(x, y, "x", "y");
    
    std::cout << std::endl;
    
    // 测试字符串交换
    std::string str1 = "Hello", str2 = "World";
    std::cout << "=== 字符串交换测试 ===" << std::endl;
    swapAndSave(str1, str2, "str1", "str2");
    
    std::cout << std::endl;
    
    // 测试浮点数交换
    double a = 3.14, b = 2.71;
    std::cout << "=== 浮点数交换测试 ===" << std::endl;
    swapAndSave(a, b, "a", "b");
    
    return 0;
}