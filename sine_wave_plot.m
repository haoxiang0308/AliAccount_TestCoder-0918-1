% This MATLAB script plots a sine wave.
% It generates the x-values, computes the sine of those values,
% and then plots the result with labels and a title.

% Define the range of x values
x = linspace(0, 4*pi, 1000); % Creates 1000 points from 0 to 4*pi

% Calculate the sine of x
y = sin(x);

% Plot the sine wave
plot(x, y);

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Plot of Sine Wave');

% Optional: Add a grid for better readability
grid on;