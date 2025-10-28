#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <chrono>

// 模板函数：交换两个变量的值
template<typename T>
void swapValues(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFilename(const std::string& extension = ".txt") {
    // 使用当前时间作为种子
    auto seed = std::chrono::high_resolution_clock::now().time_since_epoch().count();
    std::mt19937 generator(seed);
    std::uniform_int_distribution<int> distribution(100000, 999999); // 生成6位随机数
    
    int randomNum = distribution(generator);
    return "swap_result_" + std::to_string(randomNum) + extension;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwapResult(T& a, T& b, const std::string& description = "") {
    // 先交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string filename = generateRandomFilename(".txt");
    
    // 打开文件并写入结果
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Swap Result\n";
        file << "============\n";
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

// 示例用法
int main() {
    // 测试整数交换
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    saveSwapResult(x, y, "Integer swap example");
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    
    std::cout << std::endl;
    
    // 测试浮点数交换
    double a = 3.14, b = 2.71;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    saveSwapResult(a, b, "Double swap example");
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    
    std::cout << std::endl;
    
    // 测试字符串交换
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    saveSwapResult(str1, str2, "String swap example");
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}