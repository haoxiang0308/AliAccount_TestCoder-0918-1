import tensorflow as tf
import numpy as np
import random

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)
random.seed(42)

# Generate synthetic data for linear regression
num_samples = 1000
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weights = 2.5
true_bias = 0.5
noise = 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
y = true_weights * X + true_bias + noise

# Split data into training and testing sets
split_idx = int(0.8 * num_samples)
X_train, X_test = X[:split_idx], X[split_idx:]
y_train, y_test = y[:split_idx], y[split_idx:]

# Build the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model
model.compile(
    optimizer='adam',
    loss='mean_squared_error',
    metrics=['mae']
)

# Print model summary
print("Model Summary:")
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

# Make predictions
sample_predictions = model.predict(X_test[:5])
print(f"\nSample Predictions vs Actual Values:")
for i in range(5):
    print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")

# Print learned parameters
learned_weights, learned_bias = model.layers[0].get_weights()
print(f"\nLearned Weight: {learned_weights[0][0]:.3f} (True: {true_weights})")
print(f"Learned Bias: {learned_bias[0]:.3f} (True: {true_bias})")

# Save the model
model.save('linear_regression_trained_model')
print("\nModel saved successfully!")