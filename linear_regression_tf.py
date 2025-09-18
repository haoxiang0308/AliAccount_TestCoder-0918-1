import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate synthetic data for linear regression
np.random.seed(42)
X = np.random.randn(50, 1).astype(np.float32)  # Reduced data size
y = 2 * X + 1 + 0.1 * np.random.randn(50, 1).astype(np.float32)  # y = 2x + 1 + noise

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model (reduced epochs)
history = model.fit(X, y, epochs=50, verbose=0)

# Evaluate the model
loss = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Plot the results
predictions = model.predict(X, verbose=0)
plt.scatter(X, y, label='Data')
plt.plot(X, predictions, color='red', label='Fitted line')
plt.legend()
plt.title('Linear Regression with TensorFlow')
plt.savefig('linear_regression_plot.png')
print("Plot saved as linear_regression_plot.png")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as linear_regression_model.h5")