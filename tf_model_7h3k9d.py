import tensorflow as tf
import numpy as np

# Set random seeds for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

# Generate a small dataset for linear regression
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Input(shape=(1,)),
    tf.keras.layers.Dense(1)
])

# Compile the model with optimizer, loss function, and metrics
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

print("Model created successfully!")
print("Model architecture:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(
    X, y,
    epochs=10,
    batch_size=10,
    validation_split=0.2,
    verbose=1
)

# Make predictions
print("\nMaking predictions...")
predictions = model.predict(X[:5])

print("Sample inputs, predictions, and actual values:")
for i in range(5):
    print(f"Input: {X[i][0]:.3f}, Predicted: {predictions[i][0]:.3f}, Actual: {y[i][0]:.3f}")

# Get the learned parameters
dense_layer = model.layers[1]  # Dense layer is at index 1
weights, bias = dense_layer.get_weights()

print(f"\nLearned weight: {weights[0][0]:.3f}")
print(f"Learned bias: {bias[0]:.3f}")
print(f"True relationship: y = 2*x + 1")

print("\nLinear regression model training completed successfully!")