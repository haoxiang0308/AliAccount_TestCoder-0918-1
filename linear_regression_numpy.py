import numpy as np
import matplotlib.pyplot as plt

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X.flatten() + 1 + 0.1 * np.random.randn(100).astype(np.float32)  # y = 2x + 1 + noise

# Add bias term (intercept) to X
X_with_bias = np.c_[np.ones(X.shape[0]), X.flatten()]

# Calculate weights using normal equation: w = (X^T * X)^(-1) * X^T * y
weights = np.linalg.inv(X_with_bias.T @ X_with_bias) @ X_with_bias.T @ y

# Extract bias and coefficient
bias, coefficient = weights[0], weights[1]

# Make predictions
y_pred = X_with_bias @ weights

# Calculate mean squared error
mse = np.mean((y - y_pred) ** 2)

# Display results
print(f"Mean Squared Error: {mse:.6f}")
print(f"Model Coefficient: {coefficient:.4f}")
print(f"Model Intercept (Bias): {bias:.4f}")

# Show some predictions vs actual values
print("\nSample Predictions vs Actual Values:")
for i in range(5):
    print(f"Predicted: {y_pred[i]:.4f}, Actual: {y[i]:.4f}")

# Save model parameters
np.savez('linear_regression_model.npz', bias=bias, coefficient=coefficient)
print("\nModel parameters saved as 'linear_regression_model.npz'")

# Plot results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, alpha=0.5, label='Data points')
plt.plot(X, y_pred, color='red', label='Linear regression line')
plt.xlabel('X')
plt.ylabel('y')
plt.legend()
plt.title('Linear Regression with NumPy')
plt.savefig('linear_regression_plot.png')
print("Plot saved as 'linear_regression_plot.png'")