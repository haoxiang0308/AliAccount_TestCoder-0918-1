import tensorflow as tf
import numpy as np
import random
import string

# Generate random data for linear regression
def generate_data(num_samples=100):
    X = np.random.randn(num_samples, 1).astype(np.float32)
    # True relationship: y = 2*x + 1 + noise
    y = 2 * X + 1 + 0.1 * np.random.randn(num_samples, 1).astype(np.float32)
    return X, y

# Generate the dataset
X_train, y_train = generate_data(1000)
X_test, y_test = generate_data(200)

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

# Train the model
print("\nTraining the model...")
history = model.fit(
    X_train, y_train,
    epochs=50,
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
print("\nMaking predictions...")
sample_predictions = model.predict(X_test[:5])
print("Sample predictions vs actual values:")
for i in range(5):
    print(f"X: {X_test[i][0]:.3f}, Predicted: {sample_predictions[i][0]:.3f}, Actual: {y_test[i][0]:.3f}")

# Print the learned parameters (weights and bias)
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f}")
print(f"Learned bias: {bias[0]:.3f}")
print(f"True relationship: y = 2*x + 1")