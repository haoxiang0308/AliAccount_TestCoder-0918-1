import tensorflow as tf
import numpy as np
import random
import os

# Set random seed for reproducibility
random_seed = random.randint(1, 10000)
tf.random.set_seed(random_seed)
np.random.seed(random_seed)
random.seed(random_seed)

# Generate sample data for linear regression
num_samples = 200  # Reduced for faster execution
X = np.random.randn(num_samples, 1).astype(np.float32)
true_weights = 2.5
true_bias = 0.5
y = true_weights * X + true_bias + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)

# Split data into train and test sets
train_size = int(0.8 * num_samples)
X_train, X_test = X[:train_size], X[train_size:]
y_train, y_test = y[:train_size], y[train_size:]

# Build the model
model = tf.keras.Sequential([
    tf.keras.layers.Input(shape=(1,)),
    tf.keras.layers.Dense(units=1, name='linear_layer')
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
    epochs=20,  # Reduced for faster execution
    batch_size=32,
    validation_split=0.2,
    verbose=1
)

# Evaluate the model
print("\nEvaluating the model...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss}")
print(f"Test MAE: {test_mae}")

# Make predictions
sample_predictions = model.predict(X_test[:5])
print(f"\nSample predictions vs actual values:")
for i in range(5):
    print(f"Input: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")

# Print learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f} (true: {true_weights})")
print(f"Learned bias: {bias[0]:.3f} (true: {true_bias})")

print(f"\nModel training completed successfully!")
print(f"Random seed used: {random_seed}")