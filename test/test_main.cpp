#include <iostream>
#include <cassert>

// A simple function to test
int add(int a, int b) {
    return a + b;
}

int main() {
    // Test the add function
    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
    assert(add(0, 0) == 0);
    
    std::cout << "All tests passed!" << std::endl;
    return 0;
}