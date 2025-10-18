#include <iostream>
#include <algorithm>
#include <vector>

void printArray(const std::vector<int>& arr) {
    for (int i = 0; i < arr.size(); i++) {
        std::cout << arr[i];
        if (i < arr.size() - 1) {
            std::cout << " ";
        }
    }
    std::cout << std::endl;
}

int main() {
    int n;
    
    std::cout << "Enter the number of elements: ";
    std::cin >> n;
    
    std::vector<int> arr(n);
    
    std::cout << "Enter " << n << " integers: ";
    for (int i = 0; i < n; i++) {
        std::cin >> arr[i];
    }
    
    std::cout << "Original array: ";
    printArray(arr);
    
    // Sort the array in ascending order
    std::sort(arr.begin(), arr.end());
    
    std::cout << "Sorted array (ascending): ";
    printArray(arr);
    
    return 0;
}