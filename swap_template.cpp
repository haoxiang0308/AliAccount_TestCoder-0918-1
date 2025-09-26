#include <iostream>
#include <utility> // Required for std::swap (though we are implementing our own)

// Template function to swap two variables of any type
template<typename T>
void my_swap(T& a, T& b) {
    T temp = std::move(a); // Move/copy 'a' into temporary variable
    a = std::move(b);      // Move/copy 'b' into 'a'
    b = std::move(temp);   // Move/copy the temporary variable into 'b'
}

int main() {
    int x = 5, y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    my_swap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    double p = 3.14, q = 2.71;
    std::cout << "Before swap: p = " << p << ", q = " << q << std::endl;
    my_swap(p, q);
    std::cout << "After swap: p = " << p << ", q = " << q << std::endl;

    return 0;
}