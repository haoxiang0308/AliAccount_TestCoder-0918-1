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
    std::uniform_int_distribution<> dis(0, 999999);
    
    std::ostringstream oss;
    oss << "swap_result_" << dis(gen) << extension;
    return oss.str();
}

// 将交换后的值保存到文件
template<typename T>
void saveSwapToFile(T& a, T& b, const std::string& filename) {
    // 先交换值
    swap(a, b);
    
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swap:\n";
        file << "a = " << a << "\n";
        file << "b = " << b << "\n";
        file.close();
        std::cout << "Values saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file: " << filename << std::endl;
    }
}

int main() {
    // 示例：交换整数
    int x = 10, y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    
    std::string filename1 = generateRandomFilename(".txt");
    saveSwapToFile(x, y, filename1);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;
    
    // 示例：交换浮点数
    double a = 3.14, b = 2.71;
    std::cout << "\nBefore swap: a = " << a << ", b = " << b << std::endl;
    
    std::string filename2 = generateRandomFilename(".txt");
    saveSwapToFile(a, b, filename2);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;
    
    // 示例：交换字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "\nBefore swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    std::string filename3 = generateRandomFilename(".txt");
    saveSwapToFile(str1, str2, filename3);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}