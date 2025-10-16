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
std::string generateRandomFileName(const std::string& extension = ".txt") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(100000, 999999); // 生成6位随机数
    
    std::ostringstream oss;
    oss << "swap_output_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void saveSwapToFile(T& a, T& b, const std::string& filename) {
    // 先交换值
    swap(a, b);
    
    // 保存到文件
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << std::endl;
    }
}

// 重载版本：先保存当前值，然后交换，再保存交换后的值
template<typename T>
void saveSwapToFileWithHistory(T& a, T& b) {
    std::string filename = generateRandomFileName(".txt");
    
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Before swap:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        
        // 执行交换
        swap(a, b);
        
        file << "\nAfter swap:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        file.close();
        std::cout << "Swap history saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << std::endl;
    }
}

int main() {
    // 示例1：使用整数
    int x = 10, y = 20;
    std::cout << "Original values: x = " << x << ", y = " << y << std::endl;
    saveSwapToFileWithHistory(x, y);
    std::cout << "Current values: x = " << x << ", y = " << y << std::endl << std::endl;
    
    // 示例2：使用浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Original values: a = " << a << ", b = " << b << std::endl;
    saveSwapToFileWithHistory(a, b);
    std::cout << "Current values: a = " << a << ", b = " << b << std::endl << std::endl;
    
    // 示例3：使用字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Original values: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    saveSwapToFileWithHistory(str1, str2);
    std::cout << "Current values: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}