import tensorflow as tf
import numpy as np

# Generate random data for demonstration
np.random.seed(42)
X = np.random.rand(100, 1).astype(np.float32)
y = 3.5 * X + 2.0 + np.random.randn(100, 1).astype(np.float32) * 0.1

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
w, b = model.layers[0].get_weights()
print(f"Learned weight: {w[0][0]:.4f}")
print(f"Learned bias: {b[0]:.4f}")

# Make a prediction
sample_input = np.array([[0.5]], dtype=np.float32)
prediction = model.predict(sample_input)
print(f"Prediction for input {sample_input[0][0]}: {prediction[0][0]:.4f}")