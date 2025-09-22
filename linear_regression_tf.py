import tensorflow as tf
import numpy as np

# Generate sample data for linear regression
# y = 3x + 2 + noise
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 3 * X + 2 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a TensorFlow dataset
dataset = tf.data.Dataset.from_tensor_slices((X, y))
dataset = dataset.shuffle(buffer_size=100).batch(32)

# Define the linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='sgd',
    loss='mean_squared_error',
    metrics=['mean_squared_error']
)

# Display model summary
model.summary()

# Train the model
history = model.fit(dataset, epochs=100, verbose=1)

# Evaluate the model
test_loss = model.evaluate(X, y, verbose=0)
print(f"Test Loss: {test_loss}")

# Make predictions
predictions = model.predict(X[:5])
print("Sample Predictions:")
for i in range(5):
    print(f"X: {X[i][0]:.2f}, Predicted Y: {predictions[i][0]:.2f}, Actual Y: {y[i][0]:.2f}")

# Save the model
model.save("linear_regression_model.h5")
print("Model saved as linear_regression_model.h5")