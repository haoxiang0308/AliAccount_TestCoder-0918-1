% MATLAB script to plot a sine wave
% Generated randomly named file

% Define x values from 0 to 4π with small increments
x = 0:0.01:4*pi;

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

% Set axis limits for better view
xlim([0 4*pi]);

% Add x-axis labels in terms of pi
xticks(0:pi/2:4*pi);
xticklabels({'0', '\pi/2', '\pi', '3\pi/2', '2\pi', '5\pi/2', '3\pi', '7\pi/2', '4\pi'});

% Display the plot
disp('Sine wave plot created successfully!');