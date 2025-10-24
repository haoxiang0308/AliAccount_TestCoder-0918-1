# 创建一个矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)

# 也可以使用 ' 运算符进行转置
another_transposed = matrix'
println("\n使用 ' 运算符转置的矩阵:")
display(another_transposed)