import tensorflow as tf
from tensorflow import keras

# Create a simple Sequential model
model = keras.Sequential([
    keras.layers.Dense(10, activation='relu', input_shape=(784,))  # Example: 784 input units, 10 output units with ReLU activation
])

# Compile the model (optional for just saving the structure)
# model.compile(optimizer='adam', loss='sparse_categorical_crossentropy')

# Save the model structure (or the entire model)
model.save('my_model.keras')  # Saves the entire model
print("Keras model created and saved as 'my_model.keras'")