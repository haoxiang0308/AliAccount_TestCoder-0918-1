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

int main() {
    // 示例：交换两个整数
    int x = 5;
    int y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;

    // 示例：交换两个字符串
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // 生成随机文件名
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 1000000);
    std::string filename = "swap_output_" + std::to_string(dis(gen)) + ".cpp";

    // 将代码保存到文件
    std::ofstream file(filename);
    file << "#include <iostream>\n";
    file << "#include <fstream>\n";
    file << "#include <string>\n";
    file << "#include <random>\n\n";
    file << "// 模板函数，用于交换两个变量的值\n";
    file << "template<typename T>\n";
    file << "void swap(T& a, T& b) {\n";
    file << "    T temp = a;\n";
    file << "    a = b;\n";
    file << "    b = temp;\n";
    file << "}\n\n";
    file << "int main() {\n";
    file << "    // 示例：交换两个整数\n";
    file << "    int x = 5;\n";
    file << "    int y = 10;\n";
    file << "    std::cout << \"交换前: x = \" << x << \", y = \" << y << std::endl;\n";
    file << "    swap(x, y);\n";
    file << "    std::cout << \"交换后: x = \" << x << \", y = \" << y << std::endl;\n\n";
    file << "    // 示例：交换两个字符串\n";
    file << "    std::string str1 = \"Hello\";\n";
    file << "    std::string str2 = \"World\";\n";
    file << "    std::cout << \"交换前: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n";
    file << "    swap(str1, str2);\n";
    file << "    std::cout << \"交换后: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;\n\n";
    file << "    return 0;\n";
    file << "}\n";

    file.close();
    std::cout << "代码已保存到文件: " << filename << std::endl;

    return 0;
}