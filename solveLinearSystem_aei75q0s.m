function X = solveLinearSystem(A, B)
% solveLinearSystem 求解线性方程组 AX = B
%
% 输入:
%   A - 系数矩阵 (n×n)
%   B - 常数向量或矩阵 (n×m)
%
% 输出:
%   X - 解向量或矩阵 (n×m)
%
% 示例:
%   A = [2 1; 1 -1];
%   B = [5; 0];
%   X = solveLinearSystem(A, B);

% 检查输入参数
if nargin ~= 2
    error('需要两个输入参数: 系数矩阵A和常数向量B');
end

% 获取矩阵维度
[n1, n2] = size(A);
[m1, m2] = size(B);

% 验证A是方阵
if n1 ~= n2
    error('系数矩阵A必须是方阵');
end

% 验证B的行数与A匹配
if m1 ~= n1
    error('常数向量B的行数必须与系数矩阵A的行数相同');
end

% 检查矩阵是否奇异
if rank(A) < n1
    warning('系数矩阵可能是奇异的或接近奇异的，结果可能不准确');
end

% 求解线性方程组
try
    X = A \ B;
catch ME
    error('求解失败: %s', ME.message);
end

end