#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <sstream>

// 模板函数：交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFileName(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::ostringstream oss;
    oss << "swap_result_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwapResult(T& a, T& b, const std::string& description = "") {
    // 交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string filename = generateRandomFileName(".txt");
    
    // 将结果写入文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Swap Result\n";
        file << "=============\n";
        if (!description.empty()) {
            file << "Description: " << description << "\n";
        }
        file << "Value A: " << a << "\n";
        file << "Value B: " << b << "\n";
        file.close();
        std::cout << "Swap result saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 主函数示例
int main() {
    // 示例1：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    saveSwapResult(x, y, "Integer swap example");
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    
    std::cout << "\n";
    
    // 示例2：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    saveSwapResult(a, b, "Double swap example");
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    
    std::cout << "\n";
    
    // 示例3：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    saveSwapResult(str1, str2, "String swap example");
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}