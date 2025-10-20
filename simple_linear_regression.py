import tensorflow as tf
import numpy as np
import os

# Set environment variable to avoid threading issues
os.environ['TF_NUM_INTEROP_THREADS'] = '1'
os.environ['TF_NUM_INTRAOP_THREADS'] = '1'

# Generate sample data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd',  # Using sgd instead of adam to reduce complexity
              loss='mean_squared_error',
              metrics=['mae'])

# Display model summary
print("Model Summary:")
model.summary()

# Train the model with fewer epochs
print("\nTraining the model...")
history = model.fit(X, y, epochs=10, verbose=1)  # Reduced epochs and verbose to 1 for faster output

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f}")
print(f"Learned bias: {bias[0]:.3f}")
print(f"True weight: 2.0, True bias: 1.0")

# Make predictions
predictions = model.predict(X[:5])  # Only predict on first 5 samples
print(f"\nFirst 5 predictions: {predictions.flatten()[:5]}")
print(f"Actual values: {y[:5].flatten()}")

print(f"\nLinear regression model created and trained successfully!")