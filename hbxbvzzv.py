import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='adam', loss='mean_squared_error', metrics=['mae'])

# Display model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Make predictions
predictions = model.predict(X)

# Print final loss
final_loss = history.history['loss'][-1]
print(f"\nFinal loss: {final_loss:.6f}")

# Optional: Plot the results
plt.figure(figsize=(8, 6))
plt.scatter(X, y, alpha=0.6, label='Data')
plt.plot(X, predictions, color='red', label='Fitted line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with TensorFlow')
plt.legend()
plt.show()

print("\nLinear regression model built and trained successfully!")