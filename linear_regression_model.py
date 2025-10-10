import tensorflow as tf
import numpy as np

# Generate some dummy data for training
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_slope = 3.2
true_intercept = 1.9
y = true_slope * X + true_intercept + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X, y, epochs=100, verbose=0)

# Print final weights
final_weights = model.get_weights()
print(f"Learned slope: {final_weights[0][0][0]:.4f}")
print(f"Learned intercept: {final_weights[1][0]:.4f}")

# Save the model
model.save('/workspace/trained_linear_model.h5')
print("Model saved to /workspace/trained_linear_model.h5")