import keras
import numpy as np

# Create a simple Keras model with one dense layer
model = keras.Sequential([
    keras.layers.Dense(10, activation='relu', input_shape=(5,)),
    keras.layers.Dense(1, activation='sigmoid')
])

# Compile the model
model.compile(optimizer='adam',
              loss='binary_crossentropy',
              metrics=['accuracy'])

# Display model summary
model.summary()

# Save the model architecture and weights
model.save('simple_model.h5')

print("Model created and saved as simple_model.h5")