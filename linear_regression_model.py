import tensorflow as tf
import numpy as np

# Generate random data for demonstration
num_samples = 1000
X = np.random.randn(num_samples).astype(np.float32)
true_slope = 2.5
true_intercept = -1.3
y = true_slope * X + true_intercept + 0.1 * np.random.randn(num_samples).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
learned_slope, learned_intercept = model.layers[0].get_weights()
print(f"Learned slope: {learned_slope[0][0]:.4f}")
print(f"Learned intercept: {learned_intercept[0]:.4f}")
print(f"True slope: {true_slope:.4f}, True intercept: {true_intercept:.4f}")
