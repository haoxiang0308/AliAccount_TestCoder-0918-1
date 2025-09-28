import tensorflow as tf
import numpy as np

# Generate random data for demonstration
# X: 100 samples, 1 feature
X = np.random.rand(100, 1).astype(np.float32)
# Y: 3 * X + 2 + some_noise
Y = 3 * X + 2 + np.random.randn(100, 1).astype(np.float32) * 0.1

# Define the model using Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, Y, epochs=100, verbose=0)

# Print final weights
final_weights = model.get_weights()
print("Final Weights (Slope):", final_weights[0][0][0])
print("Final Bias:", final_weights[1][0])

# Save the model's architecture, weights, and training configuration
model.save('linear_regression_model.h5')

print("Model saved as 'linear_regression_model.h5'")