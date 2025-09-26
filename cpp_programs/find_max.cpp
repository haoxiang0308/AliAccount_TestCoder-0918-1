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
    int max_val = *std::max_element(arr.begin(), arr.end());

    // Generate a random filename (simple approach using a fixed name with a number)
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1000, 9999);
    int random_num = dis(gen);
    std::string filename = "max_result_" + std::to_string(random_num) + ".txt";

    // Write the result to the file
    std::ofstream file(filename);
    if (file.is_open()) {
        file << "The maximum value in the array is: " << max_val << std::endl;
        file.close();
        std::cout << "Result written to " << filename << std::endl;
    } else {
        std::cerr << "Error: Could not open file " << filename << std::endl;
        return 1;
    }

    return 0;
}