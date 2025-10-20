import tensorflow as tf
import numpy as np
import matplotlib.pyplot as plt

# Generate sample data for linear regression
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Create a simple linear regression model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1, input_shape=(1,))
])

# Compile the model
model.compile(optimizer='adam',
              loss='mean_squared_error',
              metrics=['mae'])

# Display model summary
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X, y, epochs=100, verbose=0)

# Get the learned parameters
weights, bias = model.layers[0].get_weights()
print(f"\nLearned weight: {weights[0][0]:.3f}")
print(f"Learned bias: {bias[0]:.3f}")
print(f"True weight: 2.0, True bias: 1.0")

# Make predictions
predictions = model.predict(X)

print(f"\nModel evaluation:")
loss, mae = model.evaluate(X, y, verbose=0)
print(f"Final loss (MSE): {loss:.4f}")
print(f"Mean Absolute Error: {mae:.4f}")

print("\nLinear regression model created and trained successfully!")