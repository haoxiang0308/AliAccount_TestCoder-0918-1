#include <iostream>
#include <fstream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>

std::string generateRandomFileName() {
    const std::string charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(0, charset.size() - 1);
    
    std::string fileName = "result_";
    for (int i = 0; i < 8; ++i) {
        fileName += charset[dis(gen)];
    }
    fileName += ".txt";
    
    return fileName;
}

int main() {
    // Example array - you can modify this as needed
    std::vector<int> arr = {3, 7, 2, 9, 1, 8, 4, 6, 5};
    
    if (arr.empty()) {
        std::cout << "Array is empty!" << std::endl;
        return 1;
    }
    
    // Find maximum element
    int maxElement = *std::max_element(arr.begin(), arr.end());
    
    // Generate random file name
    std::string fileName = generateRandomFileName();
    
    // Write result to file
    std::ofstream outFile(fileName);
    if (outFile.is_open()) {
        outFile << "Maximum number in the array: " << maxElement << std::endl;
        outFile.close();
        std::cout << "Maximum number " << maxElement << " saved to file: " << fileName << std::endl;
    } else {
        std::cout << "Could not open file for writing!" << std::endl;
        return 1;
    }
    
    return 0;
}