#include <iostream>
#include <fstream>
#include <string>
#include <random>

// 模板函数用于交换两个变量的值
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名
std::string generateRandomFileName(const std::string& extension = ".cpp") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 1000000);

    int randomNum = dis(gen);
    return "swap_function_" + std::to_string(randomNum) + extension;
}

int main() {
    // 示例：交换两个整数
    int x = 5;
    int y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 生成随机文件名
    std::string fileName = generateRandomFileName();

    // 将模板函数代码写入随机命名的文件
    std::ofstream outFile(fileName);
    if (outFile.is_open()) {
        outFile << "// Template function to swap two variables\n";
        outFile << "template<typename T>\n";
        outFile << "void mySwap(T& a, T& b) {\n";
        outFile << "    T temp = a;\n";
        outFile << "    a = b;\n";
        outFile << "    b = temp;\n";
        outFile << "}\n";
        outFile.close();
        std::cout << "模板函数已保存到文件: " << fileName << std::endl;
    } else {
        std::cerr << "无法创建文件!" << std::endl;
    }

    return 0;
}
