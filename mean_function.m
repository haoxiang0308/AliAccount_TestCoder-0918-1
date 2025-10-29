function result = calculateMean(data)
% This function calculates the mean of input data
% Input: data - a vector or matrix of numbers
% Output: result - the mean value

    if isempty(data)
        error('Input data cannot be empty');
    end
    
    result = sum(data(:)) / numel(data);
end