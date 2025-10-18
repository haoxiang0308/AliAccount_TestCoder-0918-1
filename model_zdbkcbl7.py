import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate random data for linear regression
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Print final loss
print(f"Final loss: {history.history['loss'][-1]:.4f}")

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Test the model
test_X = np.array([[0.2], [0.5], [0.8]], dtype=np.float32)
predictions = model.predict(test_X)
print("
Test predictions:")
for i in range(len(test_X)):
    print(f"Input: {test_X[i][0]:.2f}, Prediction: {predictions[i][0]:.4f}")

