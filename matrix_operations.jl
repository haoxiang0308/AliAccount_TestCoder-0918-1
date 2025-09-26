# 创建一个 3x3 的矩阵
A = [1 2 3; 4 5 6; 7 8 9]

# 对矩阵 A 进行转置
A_transposed = transpose(A)

# 打印原始矩阵和转置后的矩阵
println("Original Matrix A:")
display(A)
println("\nTransposed Matrix A':")
display(A_transposed)

# 生成一个随机文件名
random_filename = "matrix_operations_" * string(rand(UInt32)) * ".jl"

# 将代码和结果保存到随机命名的 .jl 文件中
open(random_filename, "w") do io
    println(io, "# Generated Julia script for matrix operations")
    println(io, "# Original Matrix A:")
    println(io, "A = $A")
    println(io, "# Transposed Matrix A':")
    println(io, "A_transposed = $A_transposed")
end

println("\nOperations saved to file: ", random_filename)
