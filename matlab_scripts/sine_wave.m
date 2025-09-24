% Sine Wave Plot
% This script generates a plot of a sine wave.

% Define the x-axis values
x = linspace(0, 2*pi, 1000);

% Calculate the sine values
y = sin(x);

% Create the plot
figure;
plot(x, y);

% Add labels and title
xlabel('x (radians)');
ylabel('sin(x)');
title('Sine Wave');

% Add a grid for better readability
grid on;

% Optional: Save the figure as an image
% Uncomment the next line to save the plot as a PNG file
% saveas(gcf, 'sine_wave.png', 'png');
