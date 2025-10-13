function avg = my_mean(vec)
    % This function calculates the mean of a vector
    if isempty(vec)
        avg = NaN; % Return NaN for empty input
        return;
    end
    
    avg = sum(vec) / length(vec);
end