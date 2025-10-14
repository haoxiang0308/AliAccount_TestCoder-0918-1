import tensorflow as tf
from tensorflow import keras

# Create a simple Sequential model
model = keras.Sequential([
    keras.layers.Dense(1, input_shape=(1,), activation='linear')  # Example: 1 neuron, linear activation
])

# Compile the model
model.compile(optimizer='adam', loss='mean_squared_error')

# Print the model summary
model.summary()

# Optionally, save the model architecture/definition (not the weights)
model.save('my_model.h5')  # This saves the full model
print("Model saved as my_model.h5")