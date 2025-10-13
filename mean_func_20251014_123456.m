function avg = calculateMean(vec)
    % Функция для вычисления среднего значения вектора
    if isempty(vec)
        avg = 0; % или NaN, в зависимости от предпочтений
        return;
    end
    avg = sum(vec) / length(vec);
end