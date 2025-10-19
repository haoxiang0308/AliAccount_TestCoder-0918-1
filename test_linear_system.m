% 测试线性方程组求解函数
clear all; close all; clc;

% 示例1: 2x2线性方程组
% 2x + y = 7
% x - y = 2
A1 = [2, 1; 1, -1];
b1 = [7; 2];
fprintf('示例1:\n');
fprintf('方程组:\n');
fprintf('2x + y = 7\n');
fprintf('x - y = 2\n');
x1 = solve_linear_system(A1, b1);
fprintf('解: x = %.2f, y = %.2f\n\n', x1(1), x1(2));

% 示例2: 3x3线性方程组
% 3x + 2y + z = 10
% x - y + z = 2
% 2x + y - 3z = -1
A2 = [3, 2, 1; 1, -1, 1; 2, 1, -3];
b2 = [10; 2; -1];
fprintf('示例2:\n');
fprintf('方程组:\n');
fprintf('3x + 2y + z = 10\n');
fprintf('x - y + z = 2\n');
fprintf('2x + y - 3z = -1\n');
x2 = solve_linear_system(A2, b2);
fprintf('解: x = %.2f, y = %.2f, z = %.2f\n\n', x2(1), x2(2), x2(3));

% 验证解的正确性
fprintf('验证示例2的解:\n');
result = A2 * x2;
fprintf('A*x = [%.2f; %.2f; %.2f]\n', result(1), result(2), result(3));
fprintf('b = [%.2f; %.2f; %.2f]\n', b2(1), b2(2), b2(3));