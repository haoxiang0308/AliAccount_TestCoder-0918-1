#include <iostream>

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
    double a = 1.5;
    double b = 2.5;
    std::cout << "Before swap: a = " << a << ", b = " << b << std::endl;
    mySwap(a, b);
    std::cout << "After swap: a = " << a << ", b = " << b << std::endl;

    return 0;
}