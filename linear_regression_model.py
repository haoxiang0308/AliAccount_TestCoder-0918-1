import tensorflow as tf
import numpy as np

# Generate some sample data
np.random.seed(0)
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 3 * X_train + 2 + np.random.normal(0, 0.1, (100, 1)).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=[1])
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X_train, y_train, epochs=100, verbose=0)

# Print the learned weights
print("Learned weights:", model.get_weights())

# Save the model
model.save('linear_regression_model.h5')
print("Model saved to 'linear_regression_model.h5'")