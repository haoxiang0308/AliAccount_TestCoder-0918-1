import tensorflow as tf
import numpy as np

# Generate random data for demonstration
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 3.5 * X_train + 2.0 + np.random.randn(100, 1).astype(np.float32) * 0.1  # y = 3.5x + 2 + noise

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
print("Training the model...")
model.fit(X_train, y_train, epochs=100, verbose=0)

# Print final weights
final_weights = model.get_weights()
print(f"Final weight (slope): {final_weights[0][0][0]:.4f}")
print(f"Final bias (intercept): {final_weights[1][0]:.4f}")

# Save the model
model.save('linear_regression_model.h5')
print("\nModel trained and saved as 'linear_regression_model.h5'.")