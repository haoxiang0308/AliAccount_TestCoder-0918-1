import tensorflow as tf
import numpy as np

# Generate some sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Evaluate the model
loss = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss}")

# Print model parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")