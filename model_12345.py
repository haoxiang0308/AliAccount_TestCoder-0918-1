import tensorflow as tf
import numpy as np

# Generate dummy data for linear regression y = 2x + 1
np.random.seed(42)
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model
model.fit(X_train, y_train, epochs=100, verbose=0)

# Save the model
model.save('/workspace/simple_linear_model.h5')
print("Model trained and saved as simple_linear_model.h5")