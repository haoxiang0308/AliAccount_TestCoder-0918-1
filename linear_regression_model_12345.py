import tensorflow as tf
import numpy as np

# Generate dummy data
X = np.random.rand(100, 1).astype(np.float32)
y = 3.5 * X + 2.0 + np.random.randn(100, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X, y, epochs=100, verbose=0)

# Print the learned parameters
print("Learned parameters: w =", model.layers[0].get_weights()[0][0][0], ", b =", model.layers[0].get_weights()[1][0])

# Save the model
model.save('linear_regression_model.h5')

print("Model saved as 'linear_regression_model.h5'")