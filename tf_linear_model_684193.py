import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate synthetic data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
true_weight = 2.5
true_bias = 0.5
y = true_weight * X + true_bias + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create the model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='adam',
              loss='mean_squared_error',
              metrics=['mae'])

# Print model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
learned_weight, learned_bias = model.layers[0].get_weights()
print(f"\nTrue weight: {true_weight}, Learned weight: {learned_weight[0][0]:.2f}")
print(f"True bias: {true_bias}, Learned bias: {learned_bias[0]:.2f}")

# Make predictions
predictions = model.predict(X)

# Evaluate the model
loss, mae = model.evaluate(X, y, verbose=0)
print(f"\nFinal loss: {loss:.4f}")
print(f"Final MAE: {mae:.4f}")

# Optional: Plot the results
plt.figure(figsize=(10, 6))
plt.scatter(X, y, alpha=0.5, label='Data')
plt.plot(X, predictions, color='red', label='Fitted line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression with TensorFlow')
plt.legend()
plt.show()

print("\nModel saved successfully!")