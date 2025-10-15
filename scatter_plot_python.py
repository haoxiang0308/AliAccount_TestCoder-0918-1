import matplotlib.pyplot as plt
import numpy as np
import random
import string

# Generate some sample data
np.random.seed(123)  # For reproducible results
x = np.random.normal(50, 15, 100)
y = 2 * x + np.random.normal(0, 10, 100)

# Create a random filename
random_name = 'scatter_plot_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.png'

# Create the scatter plot
plt.figure(figsize=(10, 8))
plt.scatter(x, y, alpha=0.6, color='blue')

# Add a trend line
z = np.polyfit(x, y, 1)
p = np.poly1d(z)
plt.plot(x, p(x), "r--", linewidth=2)

plt.title("Scatter Plot")
plt.xlabel("X Values")
plt.ylabel("Y Values")
plt.grid(True, alpha=0.3)

# Save the plot with the random filename
plt.savefig(random_name)
plt.close()  # Close the figure to free memory

print(f"Scatter plot saved as: {random_name}")