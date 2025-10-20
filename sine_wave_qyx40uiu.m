% MATLAB script to plot a sine wave
% Generate x values from 0 to 4π with small increments
x = linspace(0, 4*pi, 1000);

% Calculate y values as sine of x
y = sin(x);

% Create the plot
figure;
plot(x, y, 'b-', 'LineWidth', 2);

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Sine Wave Plot');

% Add grid for better visualization
grid on;

% Set axis limits to show the full range
xlim([0, 4*pi]);

% Display the plot
disp('Sine wave plot created successfully!');