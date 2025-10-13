#include <iostream>
#include <fstream>
#include <string>
#include <random>

// 模板函数，用于交换两个变量的值
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
    return "swap_code_" + std::to_string(dis(gen)) + extension;
}

int main() {
    // 生成随机文件名
    std::string filename = generateRandomFileName(".cpp");

    // 打开文件以写入
    std::ofstream file(filename);
    if (!file.is_open()) {
        std::cerr << "Error: Could not create file " << filename << std::endl;
        return 1;
    }

    // 将模板函数的代码写入文件
    file << "#include <iostream>\n";
    file << "\n";
    file << "// 模板函数，用于交换两个变量的值\n";
    file << "template<typename T>\n";
    file << "void swap(T& a, T& b) {\n";
    file << "    T temp = a;\n";
    file << "    a = b;\n";
    file << "    b = temp;\n";
    file << "}\n";
    file << "\n";
    file << "int main() {\n";
    file << "    // 示例：交换两个整数\n";
    file << "    int x = 5, y = 10;\n";
    file << "    std::cout << \"交换前: x = \" << x << \", y = \" << y << std::endl;\n";
    file << "    swap(x, y);\n";
    file << "    std::cout << \"交换后: x = \" << x << \", y = \" << y << std::endl;\n";
    file << "    return 0;\n";
    file << "}\n";

    // 关闭文件
    file.close();

    std::cout << "C++模板函数已保存到文件: " << filename << std::endl;

    return 0;
}