import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential([
    layers.Dense(64, activation='relu', input_shape=(10,))  # One dense layer with 64 units
])

# Display model architecture
model.summary()

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Save the model
model.save('simple_model.h5')
print("Model created and saved successfully!")