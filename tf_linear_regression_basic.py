import tensorflow as tf
import numpy as np

print("TensorFlow version:", tf.__version__)

# Generate simple linear data: y = 2*x + 1 + noise
np.random.seed(42)
X = np.random.randn(50, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(50, 1).astype(np.float32)

# Create model using Functional API instead of Sequential
inputs = tf.keras.Input(shape=(1,))
outputs = tf.keras.layers.Dense(1)(inputs)
model = tf.keras.Model(inputs=inputs, outputs=outputs)

# Compile the model
model.compile(optimizer='adam', loss='mse', metrics=['mae'])

# Print model summary
print("\nModel Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
model.fit(X, y, epochs=5, verbose=1)

# Make predictions
predictions = model.predict(X[:5])
print(f"\nSample predictions vs actual values:")
for i in range(5):
    print(f"Input: {X[i][0]:.3f}, Predicted: {predictions[i][0]:.3f}, Actual: {y[i][0]:.3f}")

# Get learned parameters
weights, bias = model.layers[1].get_weights()  # Dense layer is the second layer
print(f"\nLearned weight: {weights[0][0]:.3f} (true: 2)")
print(f"Learned bias: {bias[0]:.3f} (true: 1)")

print("\nLinear regression model created and trained successfully!")