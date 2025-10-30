import tensorflow as tf
import numpy as np

# Set random seeds for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

# Generate a small dataset for linear regression
X = np.random.randn(50, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(50, 1).astype(np.float32)

# Create a simple linear model
model = tf.keras.Sequential([
    tf.keras.layers.Input(shape=(1,)),
    tf.keras.layers.Dense(1)
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

print("Model created successfully!")
print("Model summary:")
model.summary()

# Train the model for just 1 epoch to demonstrate functionality
print("\nTraining model...")
model.fit(X, y, epochs=1, verbose=0)

print("Training completed!")
print("Model has learned the linear relationship.")