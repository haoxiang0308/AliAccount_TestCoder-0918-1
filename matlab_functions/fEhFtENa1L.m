function avg = computeAverage(varargin)
% computeAverage Вычисляет среднее значение входных аргументов
%   avg = computeAverage(x1, x2, ..., xn) возвращает среднее арифметическое
%   всех входных аргументов.
%
%   Примеры:
%       avg = computeAverage(1, 2, 3, 4, 5)
%       avg = computeAverage([1 2 3], [4 5 6])

    % Преобразуем входные аргументы в один вектор
    allValues = [];
    for i = 1:nargin
        arg = varargin{i};
        if isnumeric(arg)
            allValues = [allValues, arg(:)']; %#ok<AGROW>
        else
            error('Все аргументы должны быть числовыми.');
        end
    end
    
    % Вычисляем среднее значение
    if isempty(allValues)
        avg = 0;
    else
        avg = mean(allValues);
    end
end