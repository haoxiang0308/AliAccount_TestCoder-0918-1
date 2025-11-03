import tensorflow as tf
import numpy as np
import random

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)
random.seed(42)

# Generate simple linear data: y = 3*x + 2 + noise
X = np.random.randn(100, 1).astype(np.float32)
y = 3 * X + 2 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Input(shape=(1,)),
    tf.keras.layers.Dense(1)
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Print model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
model.fit(X, y, epochs=10, verbose=1)

# Get predictions
predictions = model.predict(X[:5])
print(f"\nSample predictions vs actual values:")
for i in range(5):
    print(f"Input: {X[i][0]:.3f}, Predicted: {predictions[i][0]:.3f}, Actual: {y[i][0]:.3f}")

# Get learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f} (true: 3)")
print(f"Learned bias: {bias[0]:.3f} (true: 2)")

print("\nLinear regression model created and trained successfully!")