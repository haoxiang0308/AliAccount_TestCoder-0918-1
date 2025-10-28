import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import numpy as np

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 5 input features, 10 neurons in dense layer
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
model.summary()

# Example: Create some dummy data to test the model
x_train = np.random.random((100, 5))  # 100 samples, 5 features each
y_train = np.random.randint(0, 10, (100,))  # Random labels between 0 and 9

# Train the model briefly
model.fit(x_train, y_train, epochs=1, verbose=1)

# Save the model
model.save('simple_keras_model.h5')

print("Model created, trained, and saved successfully!")