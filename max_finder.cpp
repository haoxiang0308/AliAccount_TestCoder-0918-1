#include <iostream>
#include <vector>
#include <algorithm>
#include <random>
#include <ctime>

int main() {
    // Create a random number generator
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dis(1, 100);

    // Generate a random array size between 5 and 15
    int size = dis(gen) % 11 + 5;
    std::vector<int> arr(size);

    // Fill the array with random numbers
    std::cout << "Generated array: ";
    for (int i = 0; i < size; ++i) {
        arr[i] = dis(gen);
        std::cout << arr[i] << " ";
    }
    std::cout << std::endl;

    // Find the maximum element using std::max_element
    auto max_it = std::max_element(arr.begin(), arr.end());
    int max_value = *max_it;

    // Print the result
    std::cout << "Maximum value in the array: " << max_value << std::endl;

    return 0;
}