% MATLAB script to plot a sine wave
% Generate x values from 0 to 4π with small increments
x = 0:0.01:4*pi;

% Calculate y values as sine of x
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add title and labels
title('Sine Wave');
xlabel('x (radians)');
ylabel('sin(x)');

% Add grid for better visualization
grid on;

% Set axis limits to show the full range
xlim([0 4*pi]);