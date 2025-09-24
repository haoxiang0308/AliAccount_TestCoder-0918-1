import keras
from keras import layers

model = keras.Sequential([
    layers.Dense(10, activation='relu', input_shape=(784,))
])

model.summary()