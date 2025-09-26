import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a simple Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,)),  # Example: 784 input units, 10 output units
])

# The model is now created. You can build, compile, and train it as needed.
# For this task, just creating the structure is sufficient.
print(model.summary())