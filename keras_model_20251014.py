import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Define a Sequential model
model = keras.Sequential([
    # Add a Dense layer with 10 units and ReLU activation
    layers.Dense(10, activation='relu', input_shape=(None,)),
    # Add an output layer with 1 unit
    layers.Dense(1)
])

# Display the model's architecture
model.summary()

# Save the model (uncompiled) to a file
model.save('my_first_keras_model.h5')

print("Keras model created and saved as 'my_first_keras_model.h5'")