import tensorflow as tf
import numpy as np

# Generate some random data for demonstration
num_samples = 100
X = np.random.rand(num_samples, 1).astype(np.float32)
y = 3.5 * X + 2.0 + np.random.randn(num_samples, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
w, b = model.layers[0].get_weights()
print(f"Learned weight: {w[0][0]:.4f}")
print(f"Learned bias: {b[0]:.4f}")

print("Model training completed.")