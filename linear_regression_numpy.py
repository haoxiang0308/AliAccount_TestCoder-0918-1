import numpy as np
import matplotlib.pyplot as plt

class LinearRegression:
    def __init__(self):
        self.weights = None
        self.bias = None
    
    def fit(self, X, y, learning_rate=0.01, epochs=1000):
        # Initialize parameters
        n_samples, n_features = X.shape
        self.weights = np.zeros(n_features)
        self.bias = 0
        
        # Gradient descent
        for _ in range(epochs):
            y_predicted = np.dot(X, self.weights) + self.bias
            
            # Compute gradients
            dw = (1/n_samples) * np.dot(X.T, (y_predicted - y))
            db = (1/n_samples) * np.sum(y_predicted - y)
            
            # Update parameters
            self.weights -= learning_rate * dw
            self.bias -= learning_rate * db
    
    def predict(self, X):
        return np.dot(X, self.weights) + self.bias

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1)
y = 2 * X.squeeze() + 1 + 0.1 * np.random.randn(100)

# Create and train the model
model = LinearRegression()
model.fit(X, y, learning_rate=0.01, epochs=1000)

# Make predictions
predictions = model.predict(X[:5])
print("Sample predictions vs actual values:")
for i in range(5):
    print(f"Predicted: {predictions[i]:.4f}, Actual: {y[i]:.4f}")

# Calculate final loss (MSE)
final_predictions = model.predict(X)
mse = np.mean((final_predictions - y) ** 2)
print(f"\nFinal Mean Squared Error: {mse:.6f}")

# Plot results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, color='blue', label='Data points')
plt.plot(X, final_predictions, color='red', label='Regression line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with NumPy')
plt.legend()
plt.grid(True)
plt.savefig('linear_regression_plot.png')
print("\nPlot saved as 'linear_regression_plot.png'")