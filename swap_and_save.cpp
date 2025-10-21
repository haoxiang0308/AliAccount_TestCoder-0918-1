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
    // 使用当前时间作为种子
    auto seed = std::chrono::high_resolution_clock::now().time_since_epoch().count();
    std::mt19937 generator(seed);
    
    // 生成随机数作为文件名的一部分
    std::uniform_int_distribution<int> distribution(100000, 999999);
    int randomNum = distribution(generator);
    
    return "swap_output_" + std::to_string(randomNum) + extension;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
std::string saveSwappedValuesToFile(T& a, T& b, const std::string& varNameA = "a", const std::string& varNameB = "b") {
    // 先交换值
    swapValues(a, b);
    
    // 生成随机文件名
    std::string fileName = generateRandomFileName(".txt");
    
    // 打开文件进行写入
    std::ofstream outFile(fileName);
    if (!outFile) {
        throw std::runtime_error("无法创建文件: " + fileName);
    }
    
    // 写入交换后的值
    outFile << "交换后的值:\n";
    outFile << varNameA << " = " << a << "\n";
    outFile << varNameB << " = " << b << "\n";
    
    outFile.close();
    
    std::cout << "已将交换后的值保存到文件: " << fileName << std::endl;
    return fileName;
}

// 示例用法
int main() {
    // 测试整数
    int x = 10, y = 20;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    std::string file1 = saveSwappedValuesToFile(x, y, "x", "y");
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl << std::endl;
    
    // 测试浮点数
    double a = 3.14, b = 2.71;
    std::cout << "交换前: a = " << a << ", b = " << b << std::endl;
    std::string file2 = saveSwappedValuesToFile(a, b, "a", "b");
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl << std::endl;
    
    // 测试字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    std::string file3 = saveSwappedValuesToFile(str1, str2, "str1", "str2");
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    return 0;
}