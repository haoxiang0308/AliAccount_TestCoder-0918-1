#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

// 模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 函数：生成随机文件名
std::string generateRandomFileName(const std::string& extension = ".cpp") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    
    std::string filename = "swap_template_" + std::to_string(dis(gen)) + extension;
    return filename;
}

int main() {
    // 示例：交换不同类型的变量
    int x = 5, y = 10;
    std::cout << "交换前: x = " << x << ", y = " << y << std::endl;
    swap(x, y);
    std::cout << "交换后: x = " << x << ", y = " << y << std::endl;
    
    double a = 3.14, b = 2.71;
    std::cout << "交换前: a = " << a << ", b = " << b << std::endl;
    swap(a, b);
    std::cout << "交换后: a = " << a << ", b = " << b << std::endl;
    
    std::string str1 = "Hello", str2 = "World";
    std::cout << "交换前: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    swap(str1, str2);
    std::cout << "交换后: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    
    // 生成随机文件名并保存代码
    std::string randomFileName = generateRandomFileName(".cpp");
    std::ofstream file(randomFileName);
    
    if (file.is_open()) {
        file << "#include <iostream>\n";
        file << "#include <fstream>\n";
        file << "#include <string>\n";
        file << "#include <random>\n";
        file << "#include <ctime>\n\n";
        file << "// 模板函数：交换两个变量的值\n";
        file << "template<typename T>\n";
        file << "void swap(T& a, T& b) {\n";
        file << "    T temp = a;\n";
        file << "    a = b;\n";
        file << "    b = temp;\n";
        file << "}\n\n";
        file << "int main() {\n";
        file << "    // 示例：交换两个整数\n";
        file << "    int x = 5, y = 10;\n";
        file << "    std::cout << \"交换前: x = \" << x << \", y = \" << y << std::endl;\n";
        file << "    swap(x, y);\n";
        file << "    std::cout << \"交换后: x = \" << x << \", y = \" << y << std::endl;\n";
        file << "    return 0;\n";
        file << "}\n";
        file.close();
        std::cout << "\n代码已保存到文件: " << randomFileName << std::endl;
    } else {
        std::cout << "无法创建文件!" << std::endl;
    }
    
    return 0;
}