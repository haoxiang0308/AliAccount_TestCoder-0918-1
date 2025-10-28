#!/bin/bash
# Script to compile and run the Zig program if Zig is available

if command -v zig &> /dev/null; then
    echo "Zig is available. Compiling and running the program..."
    zig build-exe point_struct.zig
    ./point_struct
    echo "Program executed successfully!"
else
    echo "Zig is not installed. The Zig source code is available in point_struct.zig"
    echo "To run: zig build-exe point_struct.zig && ./point_struct"
fi