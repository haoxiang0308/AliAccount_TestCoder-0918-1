function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 方程组的解向量
%
% 示例:
%   A = [2, 1; 1, -1];
%   b = [3; 0];
%   x = solve_linear_system(A, b);

    % 检查输入矩阵的维度是否匹配
    [m, n] = size(A);
    if m ~= length(b)
        error('系数矩阵A的行数必须与常数向量b的长度相同');
    end
    
    % 检查矩阵A是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('系数矩阵不是方阵，可能没有唯一解');
    end
    
    % 检查矩阵的行列式（对于方阵）
    if m == n
        detA = det(A);
        if abs(detA) < eps
            warning('系数矩阵接近奇异，可能没有唯一解');
        end
    end
    
    % 求解线性方程组
    x = A \ b;  % 使用MATLAB的左除运算符求解
    
    % 验证解的正确性
    residual = norm(A * x - b);
    if residual > 1e-10
        warning('解的精度较低，残差为: %f', residual);
    end
    
end