import numpy as np
import matplotlib.pyplot as plt
import random
import string

# Generate x values
x = np.linspace(0, 10, 100)

# Create multiple y values
y1 = np.sin(x)
y2 = np.cos(x)
y3 = np.sin(x) * np.cos(x)
y4 = np.sin(x)**2

# Plot all lines
plt.figure(figsize=(10, 6))
plt.plot(x, y1, 'r-', linewidth=2, label='sin(x)')
plt.plot(x, y2, 'b--', linewidth=2, label='cos(x)')
plt.plot(x, y3, 'g:', linewidth=2, label='sin(x)cos(x)')
plt.plot(x, y4, 'k-.', linewidth=2, label='sin²(x)')

# Add labels and title
plt.xlabel('X Values')
plt.ylabel('Y Values')
plt.title('Multiple Lines Plot')
plt.legend(loc='best')
plt.grid(True)

# Generate random filename with letters and numbers
random_name = 'plot_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.png'

# Save the figure
plt.savefig(random_name)
plt.show()

print(f'Plot saved as {random_name}')