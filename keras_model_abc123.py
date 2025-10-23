import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple model with one dense layer
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Input shape of 5, 10 neurons in the dense layer
])

# Print model summary to verify the model structure
print("Model Summary:")
model.summary()

print("Keras model with one dense layer created successfully!")