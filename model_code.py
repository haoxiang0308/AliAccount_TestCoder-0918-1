import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 5 input features, 10 neurons
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Example: Create dummy data to test the model
x_train = np.random.random((100, 5))
y_train = np.random.randint(0, 2, (100,))

# Train the model for a few epochs
model.fit(x_train, y_train, epochs=5, verbose=1)

# Save the model (optional)
# model.save('my_model.h5')