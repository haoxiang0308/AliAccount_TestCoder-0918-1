import tensorflow as tf
import numpy as np

# Generate small dataset for linear regression
def generate_data(num_samples=50):
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # True relationship: y = 2*x + 1 + noise
    y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Generate the dataset
X_train, y_train = generate_data(100)
X_test, y_test = generate_data(20)

# Build a simple linear regression model using Keras
model = tf.keras.Sequential([
    tf.keras.layers.Input(shape=(1,)),
    tf.keras.layers.Dense(1)
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

# Train the model with fewer epochs
print("\nTraining the model...")
history = model.fit(
    X_train, y_train,
    epochs=5,  # Reduced epochs for faster execution
    batch_size=10,
    validation_split=0.2,
    verbose=1
)

# Evaluate the model
print("\nEvaluating the model...")
test_loss, test_mae = model.evaluate(X_test, y_test, verbose=0)
print(f"Test Loss (MSE): {test_loss:.4f}")
print(f"Test MAE: {test_mae:.4f}")

# Make predictions
print("\nMaking predictions...")
sample_predictions = model.predict(X_test[:5])
print("Sample predictions vs actual values:")
for i in range(5):
    print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")

# Print the learned parameters (weights and bias)
weights, bias = model.layers[1].get_weights()  # Dense layer is at index 1
print(f"\nLearned weight: {weights[0][0]:.3f}")
print(f"Learned bias: {bias[0]:.3f}")
print(f"True relationship: y = 2*x + 1")