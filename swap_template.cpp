#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <chrono>

// 模板函数用于交换两个变量的值
template<typename T>
void swap_values(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generate_random_filename(const std::string& extension = ".txt") {
    // 使用当前时间作为随机种子
    auto seed = std::chrono::high_resolution_clock::now().time_since_epoch().count();
    std::mt19937 generator(seed);
    std::uniform_int_distribution<int> distribution(100000, 999999); // 生成6位随机数
    
    int random_num = distribution(generator);
    return "swap_output_" + std::to_string(random_num) + extension;
}

// 将交换后的值保存到随机命名的文件中
template<typename T>
void save_swap_to_file(T& a, T& b, const std::string& prefix = "") {
    // 交换值
    swap_values(a, b);
    
    // 生成随机文件名
    std::string filename = generate_random_filename(".txt");
    
    // 打开文件并写入交换后的值
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "After swapping:\n";
        file << "Value 1: " << a << "\n";
        file << "Value 2: " << b << "\n";
        if (!prefix.empty()) {
            file << "Prefix: " << prefix << "\n";
        }
        file.close();
        std::cout << "Values swapped and saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << " for writing." << std::endl;
    }
}

// 主函数演示
int main() {
    // 测试整数
    int x = 10, y = 20;
    std::cout << "Before swap - x: " << x << ", y: " << y << std::endl;
    save_swap_to_file(x, y, "Integer swap");
    std::cout << "After save_swap_to_file - x: " << x << ", y: " << y << std::endl << std::endl;
    
    // 测试浮点数
    double a = 3.14, b = 2.71;
    std::cout << "Before swap - a: " << a << ", b: " << b << std::endl;
    save_swap_to_file(a, b, "Double swap");
    std::cout << "After save_swap_to_file - a: " << a << ", b: " << b << std::endl << std::endl;
    
    // 测试字符串
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap - str1: " << str1 << ", str2: " << str2 << std::endl;
    save_swap_to_file(str1, str2, "String swap");
    std::cout << "After save_swap_to_file - str1: " << str1 << ", str2: " << str2 << std::endl;
    
    return 0;
}