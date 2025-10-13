#include <iostream>
#include <fstream>
#include <string>
#include <cstdlib> // For rand()

// Template function to swap two variables
template<typename T>
void mySwap(T& a, T& b) {
    T temp = a;
    a = b;
    b = temp;
}

int main() {
    // Example usage with integers
    int x = 5;
    int y = 10;
    std::cout << "Before swap: x = " << x << ", y = " << y << std::endl;
    mySwap(x, y);
    std::cout << "After swap: x = " << x << ", y = " << y << std::endl;

    // Example usage with strings
    std::string str1 = "Hello";
    std::string str2 = "World";
    std::cout << "Before swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;
    mySwap(str1, str2);
    std::cout << "After swap: str1 = " << str1 << ", str2 = " << str2 << std::endl;

    // Generate a random filename
    std::string filename = "swap_output_" + std::to_string(rand()) + ".txt";
    std::cout << "Writing results to file: " << filename << std::endl;

    // Open the file for writing
    std::ofstream outFile(filename);
    if (!outFile.is_open()) {
        std::cerr << "Error opening file for writing!" << std::endl;
        return 1;
    }

    // Write the swapped values to the file
    outFile << "After swapping integers x and y:\n";
    outFile << "x = " << x << std::endl;
    outFile << "y = " << y << std::endl;
    outFile << "\nAfter swapping strings str1 and str2:\n";
    outFile << "str1 = " << str1 << std::endl;
    outFile << "str2 = " << str2 << std::endl;

    outFile.close();
    std::cout << "Results written to file successfully." << std::endl;

    return 0;
}