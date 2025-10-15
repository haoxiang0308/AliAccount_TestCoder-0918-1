#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <ctime>

std::string generateRandomFileName() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    int length = 10; // Length of random filename
    std::string result = "output_";
    
    for (int i = 0; i < length; ++i) {
        result += charset[dis(gen)];
    }
    
    result += ".txt";
    return result;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 5, 12, 4};
    
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    // Find maximum element
    int max_element = *std::max_element(arr.begin(), arr.end());
    
    // Generate random filename
    std::string filename = generateRandomFileName();
    
    // Write maximum element to file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "Maximum element in the array: " << max_element << std::endl;
        file.close();
        std::cout << "Maximum element " << max_element << " saved to file: " << filename << std::endl;
    } else {
        std::cout << "Could not open file for writing." << std::endl;
        return 1;
    }
    
    return 0;
}