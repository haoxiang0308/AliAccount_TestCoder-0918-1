import numpy as np
import matplotlib.pyplot as plt

# Generate some sample data
np.random.seed(42)
X = np.random.randn(100, 1)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1)

# Add a column of ones to X for the bias term
X_with_bias = np.c_[np.ones((X.shape[0], 1)), X]

# Calculate the optimal weights using the normal equation
# w = (X^T * X)^(-1) * X^T * y
weights = np.linalg.inv(X_with_bias.T.dot(X_with_bias)).dot(X_with_bias.T).dot(y)

print("Training completed!")
print(f"Learned weight (slope): {weights[1][0]:.4f}")
print(f"Learned bias (intercept): {weights[0][0]:.4f}")

# Make predictions
y_pred = X_with_bias.dot(weights)

# Calculate mean squared error
mse = np.mean((y - y_pred)**2)
print(f"Mean Squared Error: {mse:.6f}")

# Plot the results
plt.figure(figsize=(8, 6))
plt.scatter(X, y, color='blue', label='Data points')
plt.plot(X, y_pred, color='red', linewidth=2, label='Linear fit')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with NumPy')
plt.legend()
plt.grid(True)
plt.savefig('linear_regression_plot.png')
print("Plot saved as 'linear_regression_plot.png'")

# Save the model weights
np.save('linear_regression_weights.npy', weights)
print("Model weights saved as 'linear_regression_weights.npy'")