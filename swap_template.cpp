#include <iostream>
#include <fstream>
#include <string>
#include <random>

// Template function to swap two variables
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // Example usage with integers
    int x = 10;
    int y = 20;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example usage with doubles
    double a = 5.5;
    double b = 3.3;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    mySwap(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;

    // Generate a random filename
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(10000, 99999);
    std::string filename = "swap_code_" + std::to_string(dis(gen)) + ".cpp";

    // Write the template function code to the file
    std::ofstream file(filename);
    file << "#include <iostream>\n";
    file << "\n// Template function to swap two variables\n";
    file << "template<typename T>\n";
    file << "void mySwap(T& a, T& b) {\n";
    file << "    T temp = a;\n";
    file << "    a = b;\n";
    file << "    b = temp;\n";
    file << "}\n";
    file.close();

    std::cout << "Template function code saved to " << filename << std::endl;
    return 0;
}