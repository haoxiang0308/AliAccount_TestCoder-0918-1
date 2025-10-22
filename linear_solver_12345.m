function x = linear_solver(A, b)
% LINEAR_SOLVER 求解线性方程组 Ax = b
% 输入:
%   A - 系数矩阵
%   b - 常数向量
% 输出:
%   x - 解向量

    % 检查输入矩阵的维度
    [m, n] = size(A);
    if length(b) ~= m
        error('矩阵A的行数必须与向量b的长度相等');
    end
    
    % 检查矩阵是否为方阵（对于唯一解的情况）
    if m ~= n
        warning('矩阵不是方阵，可能没有唯一解');
    end
    
    % 构造增广矩阵
    Ab = [A, b];
    
    % 高斯消元法
    for i = 1:min(m, n)
        % 寻找主元
        [~, max_idx] = max(abs(Ab(i:m, i)));
        max_idx = max_idx + i - 1;
        
        % 交换行
        if max_idx ~= i
            Ab([i, max_idx], :) = Ab([max_idx, i], :);
        end
        
        % 检查主元是否为零
        if abs(Ab(i, i)) < eps
            error('矩阵A是奇异的，方程组可能无解或有无穷多解');
        end
        
        % 将主元归一化
        Ab(i, :) = Ab(i, :) / Ab(i, i);
        
        % 消元
        for j = 1:m
            if j ~= i
                Ab(j, :) = Ab(j, :) - Ab(j, i) * Ab(i, :);
            end
        end
    end
    
    % 提取解
    x = Ab(1:n, end);
    
    % 如果方程数量大于未知数数量，只取前n个元素
    if m > n
        x = Ab(1:n, end);
    elseif m < n
        % 如果未知数数量大于方程数量，给出警告
        warning('方程数量少于未知数数量，解可能不唯一');
        x = Ab(:, end);
    end
end

% 示例用法
function demo()
    fprintf('线性方程组求解器演示\n');
    
    % 示例1: 3x3系统
    fprintf('\n示例1:\n');
    A1 = [2, 1, 1; 
          1, 3, 2; 
          1, 0, 0];
    b1 = [4; 5; 1];
    
    fprintf('系数矩阵A1:\n');
    disp(A1);
    fprintf('常数向量b1:\n');
    disp(b1);
    
    x1 = linear_solver(A1, b1);
    fprintf('解向量x1:\n');
    disp(x1);
    
    % 验证解
    fprintf('验证 A1*x1 = b1:\n');
    disp(A1*x1);
    
    % 示例2: 2x2系统
    fprintf('\n示例2:\n');
    A2 = [3, 2; 
          1, 4];
    b2 = [7; 9];
    
    fprintf('系数矩阵A2:\n');
    disp(A2);
    fprintf('常数向量b2:\n');
    disp(b2);
    
    x2 = linear_solver(A2, b2);
    fprintf('解向量x2:\n');
    disp(x2);
    
    % 验证解
    fprintf('验证 A2*x2 = b2:\n');
    disp(A2*x2);
end