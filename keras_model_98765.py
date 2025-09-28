import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Define a Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(100,)),  # Example: 100 input features, 10 outputs with ReLU activation
])

# Print the model summary
model.summary()

# Optionally, compile the model
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy')