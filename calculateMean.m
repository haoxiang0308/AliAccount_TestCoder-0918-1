function avg = calculateMean(inputVector)
% Функция для вычисления среднего значения вектора
% Вход:
%   inputVector - вектор чисел
% Выход:
%   avg - среднее значение элементов вектора

    if isempty(inputVector)
        avg = NaN; % Возвращаем NaN, если вектор пуст
        return;
    end
    
    avg = sum(inputVector) / length(inputVector);
end