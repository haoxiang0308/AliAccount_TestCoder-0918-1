function result = calculateMean(inputArray)
% This function calculates the mean of an input array
% Input: inputArray - numeric array
% Output: result - the mean value

if isempty(inputArray)
    result = 0; % Return 0 for empty array
else
    result = sum(inputArray(:)) / numel(inputArray); % Calculate mean
end
end