function result = calculate_mean(data)
    % This function calculates the mean of the input data
    if isempty(data)
        error('Input data cannot be empty');
    end
    result = sum(data) / length(data);
end