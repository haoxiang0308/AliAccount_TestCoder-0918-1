import tensorflow as tf
import numpy as np

# Generate some dummy data for training
# Features (X) and labels (y) with a linear relationship y = 2*X + 1 + noise
np.random.seed(42)
X_train = np.random.rand(100, 1).astype(np.float32)
y_train = 2 * X_train + 1 + 0.01 * np.random.randn(100, 1).astype(np.float32)

# Define a simple linear regression model using Keras Sequential API
model = tf.keras.Sequential([
    tf.keras.layers.Dense(units=1, input_shape=(1,))
])

# Compile the model with optimizer, loss function, and metrics
model.compile(optimizer='sgd', loss='mean_squared_error', metrics=['mae'])

# Print a summary of the model
print("Model Summary:")
model.summary()

# Train the model
print("\nTraining the model...")
history = model.fit(X_train, y_train, epochs=50, verbose=0)

# Print final loss
print(f"Final training loss: {history.history['loss'][-1]:.4f}")