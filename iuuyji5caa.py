import tensorflow as tf
import numpy as np

# Generate some sample data for linear regression
# y = 2x + 1 + noise
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='adam', loss='mean_squared_error', metrics=['mae'])

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=50, verbose=0)

# Print final loss
print(f"Final loss: {history.history['loss'][-1]:.4f}")
print(f"Final MAE: {history.history['mae'][-1]:.4f}")

# Show the learned parameters (should be close to weight=2 and bias=1)
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")