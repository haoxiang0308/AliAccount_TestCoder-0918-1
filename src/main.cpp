#include <iostream>
#include "calculator.h"

int main() {
    int a = 5;
    int b = 3;
    
    std::cout << "Addition: " << add(a, b) << std::endl;
    std::cout << "Multiplication: " << multiply(a, b) << std::endl;
    
    return 0;
}