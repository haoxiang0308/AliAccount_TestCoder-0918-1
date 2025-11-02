% MATLAB script to plot a sine wave
% Generate x values from 0 to 4π with small increments
x = 0:0.01:4*pi;

% Calculate y values as sine of x
y = sin(x);

% Create the plot
figure;
plot(x, y);

% Add labels and title
xlabel('x');
ylabel('sin(x)');
title('Sine Wave Plot');

% Add grid for better visualization
grid on;

% Set axis limits for better view
xlim([0 4*pi]);

% Display the plot
disp('Sine wave plot created successfully!');