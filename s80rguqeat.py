import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a model with one dense layer
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(10,)),
    layers.Dense(1, activation='sigmoid')
])

# Display model summary
model.summary()

# Compile the model
model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

print('Keras model with one dense layer created successfully!')
