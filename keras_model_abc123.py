import tensorflow as tf

# Create a simple Keras model with one dense layer
model = tf.keras.Sequential([
    tf.keras.layers.Dense(10, activation='relu', input_shape=(4,))
])

# Compile the model
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

# Print the model summary
model.summary()

# Save the model architecture and weights (optional)
# model.save('my_model.keras')