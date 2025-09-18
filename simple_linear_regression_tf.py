import tensorflow as tf
import numpy as np

# Create TensorFlow model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Generate some sample data
X_sample = np.array([[1.0]])
y_sample = np.array([[3.0]])  # 2*1 + 1 = 3

# Build the model by calling it with sample data
_ = model(X_sample)

# Save the model
model.save('simple_linear_regression_model.h5')
print("Model saved as simple_linear_regression_model.h5")

# Print model summary
model.summary()