import tensorflow as tf
import numpy as np

# Generate dummy data for linear regression: y = 2x + 1 + noise
np.random.seed(42)
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X_train, y_train, epochs=100, verbose=0)

print("Model training completed.")
print("Final weights (slope):", model.get_weights()[0][0][0])
print("Final bias:", model.get_weights()[1][0])