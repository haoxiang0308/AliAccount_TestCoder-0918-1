% Define the x-axis range
x = linspace(0, 4*pi, 1000);

% Calculate the sine wave values
y = sin(x);

% Plot the sine wave
plot(x, y);

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Plot of Sine Wave');

% Add grid for better visualization
grid on;