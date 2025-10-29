# Julia代码：创建矩阵并进行转置操作

# 创建一个3x3的矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
println(matrix)

# 对矩阵进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
println(transposed_matrix)

# 也可以使用 ' 进行转置
transposed_matrix_alt = matrix'

println("\n使用 ' 运算符转置后的矩阵:")
println(transposed_matrix_alt)

# 创建一个非方阵进行测试
rect_matrix = [1 2 3 4; 5 6 7 8]

println("\n原始矩形矩阵:")
println(rect_matrix)

println("\n转置后的矩形矩阵:")
println(transpose(rect_matrix))