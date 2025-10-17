import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weight = 2.5
true_bias = 0.5
y = true_weight * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Split the data into training and testing sets
train_size = int(0.8 * num_samples)
X_train, X_test = X[:train_size], X[train_size:]
y_train, y_test = y[:train_size], y[train_size:]

print(f"Training samples: {len(X_train)}")
print(f"Testing samples: {len(X_test)}")

# Build the linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Display model architecture
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(
    X_train, y_train,
    epochs=100,
    batch_size=32,
    validation_split=0.2,
    verbose=1
)

# Evaluate the model
print("\nEvaluating the model...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss:.4f}")
print(f"Test MAE: {test_mae:.4f}")

# Get the learned parameters
learned_weight, learned_bias = model.layers[0].get_weights()
print(f"\nTrue weight: {true_weight}, Learned weight: {learned_weight[0][0]:.4f}")
print(f"True bias: {true_bias}, Learned bias: {learned_bias[0]:.4f}")

# Make predictions
predictions = model.predict(X_test)

# Plot the results
plt.figure(figsize=(12, 4))

# Plot training history
plt.subplot(1, 2, 1)
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title('Model Loss During Training')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend()

# Plot predictions vs actual
plt.subplot(1, 2, 2)
plt.scatter(X_test, y_test, alpha=0.5, label='Actual')
plt.scatter(X_test, predictions, alpha=0.5, label='Predicted')
plt.title('Actual vs Predicted Values')
plt.xlabel('X')
plt.ylabel('y')
plt.legend()

plt.tight_layout()
plt.show()

print("\nLinear regression model successfully built and trained!")