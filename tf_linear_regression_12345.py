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

# Print model summary
model.summary()

# Train the model
print("Training the model...")
model.fit(X_train, y_train, epochs=100, verbose=0)

# Get the learned parameters (weights and bias)
weights, biases = model.layers[0].get_weights()
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {biases[0]:.4f}")

# Make a prediction on a new sample
new_x = np.array([[0.5]], dtype=np.float32)
predicted_y = model.predict(new_x)
print(f"Prediction for x={new_x[0][0]}: y={predicted_y[0][0]:.4f}")