% This MATLAB script plots a sine wave.
% The x-axis ranges from 0 to 2*pi.
% The y-axis shows the corresponding sine values.

% Define the x-axis values from 0 to 2*pi with a small step for smoothness
x = 0:0.01:2*pi;

% Calculate the y-axis values (sine of x)
y = sin(x);

% Create the plot
figure; % Create a new figure window
plot(x, y); % Plot y versus x

% Add labels and title for clarity
xlabel('x (radians)');
ylabel('sin(x)');
title('Plot of Sine Wave');

% Add a grid for better readability
grid on;

% Optional: Save the figure as an image file
% Uncomment the next line if you want to save the plot as a PNG file.
% saveas(gcf, 'sine_wave_plot.png', 'png');