import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers

# Create a Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,)),  # Example: 10 neurons, ReLU activation, input shape 784
    # Add more layers here if needed
])

# Display the model's architecture
model.summary()

# Optionally, compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Example of saving the model in SavedModel format (recommended)
# model.save('path_to_my_model')

# Example of saving the model architecture and weights separately
# model_json = model.to_json()
# with open("model.json", "w") as json_file:
#     json_file.write(model_json)
# model.save_weights("model.h5")