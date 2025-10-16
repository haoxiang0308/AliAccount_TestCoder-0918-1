function result = random_mean_func(input_array)
    % Функция для вычисления среднего значения
    % Вход: input_array - вектор или матрица
    % Выход: result - среднее значение
    
    if isempty(input_array)
        result = NaN; % Возвращаем NaN для пустого массива
    else
        result = sum(input_array(:)) / numel(input_array);
    end
end
