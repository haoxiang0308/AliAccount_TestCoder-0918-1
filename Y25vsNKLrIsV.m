function x = solve_linear_system(A, b)
% SOLVE_LINEAR_SYSTEM 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 方程组的解

    % 检查矩阵维度是否匹配
    [m, n] = size(A);
    if m ~= length(b)
        error('系数矩阵A的行数必须与常数向量b的长度相同');
    end
    
    % 检查矩阵是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('系数矩阵不是方阵，可能有无穷多解或无解');
    end
    
    % 检查矩阵的秩以确定解的存在性和唯一性
    rankA = rank(A);
    augmented_matrix = [A, b];
    rankAug = rank(augmented_matrix);
    
    if rankA ~= rankAug
        error('方程组无解，因为系数矩阵的秩不等于增广矩阵的秩');
    elseif rankA < n
        warning('方程组有无穷多解，返回一个特解');
        x = A \ b;  % 使用MATLAB的最小二乘解
    else
        % 唯一解情况
        x = A \ b;  % 使用MATLAB的左除运算符求解
    end
end

% 示例用法
function demo()
    % 示例：求解线性方程组
    % 2x + 3y = 7
    % 4x - y = 1
    A = [2, 3; 4, -1];
    b = [7; 1];
    
    fprintf('求解线性方程组:\n');
    fprintf('2x + 3y = 7\n');
    fprintf('4x - y = 1\n');
    
    x = solve_linear_system(A, b);
    fprintf('解为: x = %.2f, y = %.2f\n', x(1), x(2));
    
    % 验证解
    residual = A*x - b;
    fprintf('验证: A*x - b = [%.2e; %.2e]\n', residual(1), residual(2));
end