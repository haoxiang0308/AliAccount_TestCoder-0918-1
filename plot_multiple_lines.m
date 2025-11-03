% Generate a plot with multiple lines and save with a random filename

% Create x values
x = 0:0.1:10;

% Create multiple y values
y1 = sin(x);
y2 = cos(x);
y3 = sin(x).*cos(x);
y4 = sin(x).^2;

% Plot all lines
figure;
plot(x, y1, 'r-', 'LineWidth', 2); hold on;
plot(x, y2, 'b--', 'LineWidth', 2);
plot(x, y3, 'g:', 'LineWidth', 2);
plot(x, y4, 'k-.', 'LineWidth', 2);

% Add labels and title
xlabel('X Values');
ylabel('Y Values');
title('Multiple Lines Plot');
legend('sin(x)', 'cos(x)', 'sin(x)cos(x)', 'sin^2(x)', 'Location', 'best');
grid on;

% Generate random filename
random_name = ['plot_' num2str(randi(9999)) '.png'];

% Save the figure
saveas(gcf, random_name);

fprintf('Plot saved as %s\n', random_name);