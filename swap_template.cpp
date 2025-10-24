#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

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
    
    std::time_t now = std::time(0);
    std::string timestamp = std::to_string(now);
    std::string randomNum = std::to_string(dis(gen));
    
    return "swap_data_" + timestamp + "_" + randomNum + extension;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveToRandomFile(const T& a, const T& b, const std::string& description = "") {
    std::string filename = generateRandomFileName(".txt");
    
    std::ofstream file(filename);
    if (file.is_open()) {
        if (!description.empty()) {
            file << description << std::endl;
        }
        file << "Value A: " << a << std::endl;
        file << "Value B: " << b << std::endl;
        file.close();
        
        std::cout << "Data saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    swapValues(x, y);
    std::cout << "After swap - x: " << x << ", y: " << y << std::endl;
    saveToRandomFile(x, y, "Integer swap results:");
    
    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "\nBefore swap - a: " << a << ", b: " << b << std::endl;
    swapValues(a, b);
    std::cout << "After swap - a: " << a << ", b: " << b << std::endl;
    saveToRandomFile(a, b, "Double swap results:");
    
    // 示例：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "\nBefore swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    swapValues(str1, str2);
    std::cout << "After swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    saveToRandomFile(str1, str2, "String swap results:");
    
    return 0;
}