import tensorflow as tf
from tensorflow.keras import layers, models

# Create a model with one dense layer using Functional API
inputs = layers.Input(shape=(784,))
outputs = layers.Dense(10, activation='softmax')(inputs)
model = models.Model(inputs=inputs, outputs=outputs)

# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

# Print model information
print("Model created successfully!")
print(f"Model input shape: {model.input_shape}")
print(f"Model output shape: {model.output_shape}")