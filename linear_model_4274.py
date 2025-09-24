import tensorflow as tf
import numpy as np

# Generate dummy data for simple linear regression: y = 2 * x + 1
np.random.seed(42)
X_data = np.random.rand(100, 1).astype(np.float32)
y_data = 2 * X_data + 1 + 0.01 * np.random.randn(100, 1).astype(np.float32)

# Define the model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X_data, y_data, epochs=100, verbose=0)

print("Model training complete.")
print("Example prediction for x=5: ", model.predict(np.array([[5.0]]), verbose=0))