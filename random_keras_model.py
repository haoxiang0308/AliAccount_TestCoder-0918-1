import keras
from keras import layers

# Define a Sequential model
model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(5,))  # Example: 10 neurons, ReLU activation, input size of 5
])

# Print model summary
model.summary()

# Save the model (architecture, weights, and optimizer state)
model.save('random_model.keras')

# Alternatively, to save only the architecture to a Python file (not recommended for saving/loading models)
# config = model.get_config()
# model_class = model.__class__
# with open('random_model_architecture.py', 'w') as f:
#     f.write(f"from {model_class.__module__} import {model_class.__name__}\n")
#     f.write(f"model = {model_class.__name__}.from_config({config})\n")

print("Model defined and saved as 'random_model.keras'.")