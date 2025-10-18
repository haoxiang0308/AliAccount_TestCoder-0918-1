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
std::string generateRandomFileName(const std::string& extension = ".txt") {
    // 使用当前时间作为随机种子
    auto seed = std::chrono::high_resolution_clock::now().time_since_epoch().count();
    std::mt19937 generator(seed);
    
    // 生成随机数
    std::uniform_int_distribution<int> distribution(100000, 999999);
    int randomNum = distribution(generator);
    
    return "swap_result_" + std::to_string(randomNum) + extension;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwapToFile(T& a, T& b, const std::string& description = "") {
    // 先交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string fileName = generateRandomFileName(".txt");
    
    // 打开文件并写入结果
    std::ofstream file(fileName);
    if (file.is_open()) {
        file << "Swap Result File\n";
        file << "================\n";
        if (!description.empty()) {
            file << "Description: " << description << "\n";
        }
        file << "Value A: " << a << "\n";
        file << "Value B: " << b << "\n";
        file.close();
        std::cout << "Values swapped and saved to file: " << fileName << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << fileName << " for writing." << std::endl;
    }
}

int main() {
    // 示例1：整数交换
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    saveSwapToFile(x, y, "Integer swap example");
    std::cout << "After swap - x: " << x << ", y: " << y << std::endl << std::endl;
    
    // 示例2：浮点数交换
    double a = 3.14, b = 2.71;
    std::cout << "Before swap - a: " << a << ", b: " << b << std::endl;
    saveSwapToFile(a, b, "Double swap example");
    std::cout << "After swap - a: " << a << ", b: " << b << std::endl << std::endl;
    
    // 示例3：字符串交换
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    saveSwapToFile(str1, str2, "String swap example");
    std::cout << "After swap - str1: " << str1 << ", str2: " << str2 << std::endl << std::endl;
    
    return 0;
}