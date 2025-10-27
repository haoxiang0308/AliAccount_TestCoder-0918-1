import matplotlib.pyplot as plt
import numpy as np
import random
import string

# Generate sample data
np.random.seed(42)
n = 100
x = np.random.normal(50, 15, n)
y = 2 * x + np.random.normal(0, 10, n)  # Linear relationship with some noise

# Generate a random filename
random_name = "scatter_plot_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".png"

# Create the scatter plot
plt.figure(figsize=(8, 6))
plt.scatter(x, y, alpha=0.6, color='blue')
plt.title('Scatter Plot')
plt.xlabel('X Variable')
plt.ylabel('Y Variable')
plt.grid(True, alpha=0.3)

# Save the plot with the random filename
plt.savefig(random_name, dpi=300, bbox_inches='tight')
plt.show()

print(f"Scatter plot saved as: {random_name}")