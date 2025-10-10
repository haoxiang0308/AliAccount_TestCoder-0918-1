% This script plots a sine wave

% Define the x-axis values
x = linspace(0, 4*pi, 1000);

% Calculate the corresponding y-values (sine)
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Plot of a Sine Wave');

% Add a grid for better readability
grid on;