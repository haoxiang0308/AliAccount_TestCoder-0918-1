#include <iostream>
#include <cassert>
#include "calculator.h"

int main() {
    // Test addition
    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
    
    // Test multiplication
    assert(multiply(3, 4) == 12);
    assert(multiply(-2, 3) == -6);
    
    std::cout << "All tests passed!" << std::endl;
    return 0;
}