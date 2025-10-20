import tensorflow as tf
import numpy as np

# Set random seed for reproducibility
np.random.seed(42)

# Generate synthetic data for linear regression: y = 2x + 3 + noise
X = np.random.randn(1000, 1).astype(np.float32)
y = 2 * X + 3 + 0.1 * np.random.randn(1000, 1).astype(np.float32)

# Build a simple linear regression model using TensorFlow/Keras
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model with optimizer, loss function and metrics
model.compile(
    optimizer='sgd',  # Stochastic Gradient Descent
    loss='mean_squared_error',  # Standard loss for regression
    metrics=['mae']  # Mean Absolute Error as additional metric
)

# Display model information
print("Model Architecture:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=50, verbose=0)

# Get the learned weights
weights, bias = model.layers[0].get_weights()
print(f"\nLearned parameters:")
print(f"Weight: {weights[0][0]:.3f}")
print(f"Bias: {bias[0]:.3f}")
print(f"Expected: Weight=2.0, Bias=3.0")

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"\nFinal metrics:")
print(f"Loss (MSE): {loss:.4f}")
print(f"Mean Absolute Error: {mae:.4f}")

print("\nSimple linear regression model built and trained successfully!")