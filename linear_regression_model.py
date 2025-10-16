import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X.squeeze() + 1 + np.random.randn(100) * 0.1  # y = 2x + 1 + noise

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Print final loss
print(f"Final loss: {history.history['loss'][-1]:.4f}")

# Make predictions
predictions = model.predict(X)

# Print model weights
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Optional: Plot results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, alpha=0.6, label='Actual data')
plt.plot(X, predictions, color='red', label='Predicted line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with TensorFlow')
plt.legend()
plt.show()

print("Model training completed!")