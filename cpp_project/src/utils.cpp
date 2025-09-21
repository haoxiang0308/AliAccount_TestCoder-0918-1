#include <iostream>
#include "utils.h"

namespace utils {
    void print_message(const char* message) {
        std::cout << "Utils: " << message << std::endl;
    }
}