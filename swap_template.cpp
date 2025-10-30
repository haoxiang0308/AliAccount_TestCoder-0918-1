#include <iostream>
#include <fstream>
#include <string>
#include <random>
#include <ctime>

// C++模板函数：交换两个变量的值
template<typename T>
void swap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

// 生成随机文件名的辅助函数
std::string generateRandomFileName(const std::string& extension = ".cpp") {
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, 9);
    
    std::string filename = "random_";
    
    // 使用时间作为基础生成随机名
    auto time_now = std::time(nullptr);
    filename += std::to_string(time_now) + "_";
    
    // 添加额外的随机数字以增加唯一性
    for(int i = 0; i < 6; i++) {
        filename += std::to_string(dis(gen));
    }
    
    filename += extension;
    return filename;
}

int main() {
    // 演示模板函数的使用
    int x = 10, y = 20;
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
    
    // 将此代码保存到随机命名的文件中
    std::string randomFileName = generateRandomFileName(".cpp");
    std::ofstream outFile(randomFileName);
    
    outFile << "#include <iostream>" << std::endl;
    outFile << "#include <fstream>" << std::endl;
    outFile << "#include <string>" << std::endl;
    outFile << "#include <random>" << std::endl;
    outFile << "#include <ctime>" << std::endl;
    outFile << std::endl;
    outFile << "// C++模板函数：交换两个变量的值" << std::endl;
    outFile << "template<typename T>" << std::endl;
    outFile << "void swap(T& a, T& b) {" << std::endl;
    outFile << "    T temp = a;" << std::endl;
    outFile << "    a = b;" << std::endl;
    outFile << "    b = temp;" << std::endl;
    outFile << "}" << std::endl;
    outFile << std::endl;
    outFile << "// 生成随机文件名的辅助函数" << std::endl;
    outFile << "std::string generateRandomFileName(const std::string& extension = \".cpp\") {" << std::endl;
    outFile << "    std::random_device rd;" << std::endl;
    outFile << "    std::mt19937 gen(rd());" << std::endl;
    outFile << "    std::uniform_int_distribution<> dis(0, 9);" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    std::string filename = \"random_\";" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    // 使用时间作为基础生成随机名" << std::endl;
    outFile << "    auto time_now = std::time(nullptr);" << std::endl;
    outFile << "    filename += std::to_string(time_now) + \"_\";" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    // 添加额外的随机数字以增加唯一性" << std::endl;
    outFile << "    for(int i = 0; i < 6; i++) {" << std::endl;
    outFile << "        filename += std::to_string(dis(gen));" << std::endl;
    outFile << "    }" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    filename += extension;" << std::endl;
    outFile << "    return filename;" << std::endl;
    outFile << "}" << std::endl;
    outFile << std::endl;
    outFile << "int main() {" << std::endl;
    outFile << "    // 演示模板函数的使用" << std::endl;
    outFile << "    int x = 10, y = 20;" << std::endl;
    outFile << "    std::cout << \"交换前: x = \" << x << \", y = \" << y << std::endl;" << std::endl;
    outFile << "    swap(x, y);" << std::endl;
    outFile << "    std::cout << \"交换后: x = \" << x << \", y = \" << y << std::endl;" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    double a = 3.14, b = 2.71;" << std::endl;
    outFile << "    std::cout << \"交换前: a = \" << a << \", b = \" << b << std::endl;" << std::endl;
    outFile << "    swap(a, b);" << std::endl;
    outFile << "    std::cout << \"交换后: a = \" << a << \", b = \" << b << std::endl;" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    std::string str1 = \"Hello\", str2 = \"World\";" << std::endl;
    outFile << "    std::cout << \"交换前: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;" << std::endl;
    outFile << "    swap(str1, str2);" << std::endl;
    outFile << "    std::cout << \"交换后: str1 = \" << str1 << \", str2 = \" << str2 << std::endl;" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    // 将此代码保存到随机命名的文件中" << std::endl;
    outFile << "    std::string randomFileName = generateRandomFileName(\".cpp\");" << std::endl;
    outFile << "    std::cout << \"代码已保存到文件: \" << randomFileName << std::endl;" << std::endl;
    outFile << "    " << std::endl;
    outFile << "    return 0;" << std::endl;
    outFile << "}" << std::endl;
    
    outFile.close();
    
    std::cout << "代码已保存到文件: " << randomFileName << std::endl;
    
    return 0;
}