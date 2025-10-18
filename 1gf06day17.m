function result = calculate_mean(data)
% This function calculates the mean of the input data
% Input: data - array or matrix of numbers
% Output: result - the mean value

if isempty(data)
    result = NaN;  % Return NaN for empty input
    return;
end

result = sum(data(:)) / numel(data);  % Calculate mean

end