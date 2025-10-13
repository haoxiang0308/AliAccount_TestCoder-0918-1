function result = avg_func(vec)
    % Вычисляет среднее значение элементов вектора или массива
    % Вход:
    %   vec - вектор или массив
    % Выход:
    %   result - среднее значение элементов vec

    if isempty(vec)
        result = NaN; % Возвращаем NaN, если массив пуст
        return;
    end

    result = sum(vec(:)) / numel(vec); % Суммируем все элементы и делим на их количество
end