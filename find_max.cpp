#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <string>
#include <fstream>

int main() {
    // Example array
    std::vector<int> arr = {3, 7, 2, 9, 1};

    // Find the maximum element
    auto max_element_it = std::max_element(arr.begin(), arr.end());
    if (max_element_it != arr.end()) {
        int max_val = *max_element_it;
        std::cout << "Maximum value in the array is: " << max_val << std::endl;

        // Generate a random filename (simple approach using the max value)
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> dis(1000, 9999);
        int random_num = dis(gen);
        std::string filename = "max_value_output_" + std::to_string(random_num) + ".txt";

        // Write the result to the file
        std::ofstream file(filename);
        if (file.is_open()) {
            file << max_val << std::endl;
            file.close();
            std::cout << "Result saved to file: " << filename << std::endl;
        } else {
            std::cerr << "Could not open file for writing." << std::endl;
            return 1; // Exit with error code
        }
    } else {
        std::cerr << "Array is empty." << std::endl;
        return 1; // Exit with error code
    }

    return 0;
}