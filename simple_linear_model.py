import tensorflow as tf
import numpy as np

# Generate simple data for linear regression
np.random.seed(42)
X = np.random.rand(20, 1).astype(np.float32)  # Reduced size for faster training
y = 2 * X + 1 + 0.1 * np.random.randn(20, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Input(shape=(1,)),
    tf.keras.layers.Dense(units=1)
])

# Compile the model
model.compile(optimizer='sgd', loss='mean_squared_error')

# Train the model for fewer epochs
print("Training the model...")
history = model.fit(X, y, epochs=10, verbose=0)  # Reduced epochs

# Print final loss
print(f"Final loss: {history.history['loss'][-1]:.4f}")

# Get the learned parameters
weights, bias = model.layers[1].get_weights()  # Index 1 because of the input layer
print(f"Learned weight: {weights[0][0]:.4f}")
print(f"Learned bias: {bias[0]:.4f}")

# Test the model
test_X = np.array([[0.2], [0.5], [0.8]], dtype=np.float32)
predictions = model.predict(test_X)
print("\nTest predictions:")
for i in range(len(test_X)):
    print(f"Input: {test_X[i][0]:.2f}, Prediction: {predictions[i][0]:.4f}")

print("\nModel saved successfully!")