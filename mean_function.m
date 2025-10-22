function result = calculateMean(inputArray)
% CALCULATEMEAN computes the mean value of an input array
% Input: inputArray - numeric array of values
% Output: result - mean value of the input array

    if isempty(inputArray)
        result = NaN; % Return NaN for empty arrays
    else
        result = sum(inputArray(:)) / numel(inputArray); % Calculate mean
    end
end