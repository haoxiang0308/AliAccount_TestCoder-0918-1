import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 10 neurons, ReLU activation
])

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model summary
model.summary()

# Save the model definition (not the weights) as a Python script
model.save('my_keras_model.h5')

# To save the architecture specifically as a Python code string, you can use model.to_json()
# and write that to a .py file if needed.