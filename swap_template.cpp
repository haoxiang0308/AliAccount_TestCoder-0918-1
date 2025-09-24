#include <iostream>
#include <utility> // Required for std::swap (though we are implementing our own)

// Template function to swap two variables of any type
template<typename T>
void my_swap(T& a, T& b) {
    T temp = std::move(a); // Use move semantics if available, otherwise copy
    a = std::move(b);
    b = temp;
}

int main() {
    // Example usage with integers
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    my_swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example usage with strings
    std::string str1 = "Hello", str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    my_swap(str1, str2);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    return 0;
}