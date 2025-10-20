import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Display model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned parameters:")
print(f"Weight: {weights[0][0]:.4f}")
print(f"Bias: {bias[0]:.4f}")

# Make predictions
predictions = model.predict(X)

# Print final loss
final_loss = history.history['loss'][-1]
print(f"\nFinal loss: {final_loss:.6f}")

# Optional: Plot the results
plt.figure(figsize=(12, 4))

plt.subplot(1, 2, 1)
plt.scatter(X, y, alpha=0.6, label='True values')
plt.scatter(X, predictions, alpha=0.6, label='Predictions')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression: True vs Predicted Values')
plt.legend()

plt.subplot(1, 2, 2)
plt.plot(history.history['loss'], label='Loss')
plt.title('Model Loss Over Time')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend()

plt.tight_layout()
plt.show()

print("\nLinear regression model created and trained successfully!")