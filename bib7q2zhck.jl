# 创建矩阵并进行转置操作

# 定义一个矩阵
matrix = [1 2 3; 4 5 6; 7 8 9]

println("原始矩阵:")
display(matrix)

# 进行转置操作
transposed_matrix = transpose(matrix)

println("\n转置后的矩阵:")
display(transposed_matrix)

# 创建另一个非方阵进行演示
matrix2 = [1 2 3 4; 5 6 7 8]

println("\n第二个矩阵:")
display(matrix2)

println("\n第二个矩阵的转置:")
display(transpose(matrix2))