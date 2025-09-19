import tensorflow as tf
import numpy as np

# Generate some sample data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a TensorFlow dataset
dataset = tf.data.Dataset.from_tensor_slices((X, y))
dataset = dataset.batch(32)

# Define the linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='sgd', 
              loss='mean_squared_error',
              metrics=['mean_absolute_error'])

# Display model summary
model.summary()

# Train the model
history = model.fit(dataset, epochs=100, verbose=0)

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final loss: {loss}, Mean Absolute Error: {mae}")

# Make predictions
predictions = model.predict(X[:5])
print("Sample predictions vs actual values:")
for i in range(5):
    print(f"Predicted: {predictions[i][0]:.4f}, Actual: {y[i][0]:.4f}")

# Save the model
model.save('linear_regression_model.h5')
print("Model saved as 'linear_regression_model.h5'")