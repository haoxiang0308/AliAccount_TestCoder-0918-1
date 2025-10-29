#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

// Function to generate a random filename
std::string generateRandomFilename() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::string filename = "output_";
    
    // Use current time as seed
    std::srand(static_cast<unsigned int>(std::time(nullptr)));
    
    // Generate 10 random characters for the filename
    for (int i = 0; i < 10; ++i) {
        filename += charset[std::rand() % charset.length()];
    }
    
    filename += ".txt";
    return filename;
}

int main() {
    // Define an array of numbers
    std::vector<int> numbers = {3, 7, 2, 9, 1, 8, 5, 12, 4, 6};
    
    // Find the maximum number in the array
    int max_number = *std::max_element(numbers.begin(), numbers.end());
    
    // Print the maximum number to console
    std::cout << "Maximum number in the array: " << max_number << std::endl;
    
    // Generate a random filename
    std::string filename = generateRandomFilename();
    
    // Write the maximum number to the file
    std::ofstream outFile(filename);
    if (outFile.is_open()) {
        outFile << "Maximum number in the array: " << max_number << std::endl;
        outFile.close();
        std::cout << "Result saved to file: " << filename << std::endl;
    } else {
        std::cerr << "Unable to open file for writing." << std::endl;
        return 1;
    }
    
    return 0;
}