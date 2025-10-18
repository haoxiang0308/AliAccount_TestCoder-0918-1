% Generate a random filename for the mean function
% Using current time to create a pseudo-random name
random_suffix = datestr(now, 'yyyymmddHHMMSS');
random_filename = ['mean_func_' num2str(randi(9999)) '_' random_suffix '.m'];

% Read the original function
original_content = fileread('mean_function.m');

% Write to the new file with random name
fid = fopen(random_filename, 'w');
fprintf(fid, '%s', original_content);
fclose(fid);

fprintf('Function saved to: %s\n', random_filename);