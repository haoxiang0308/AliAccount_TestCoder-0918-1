function result = calculate_mean(arr)
% This function calculates the mean of an input array
% Input: arr - numeric array
% Output: result - mean value of the array

    if isempty(arr)
        result = NaN; % Return NaN for empty arrays
    else
        result = sum(arr) / length(arr);
    end
end