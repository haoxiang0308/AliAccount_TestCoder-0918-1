import tensorflow as tf
import numpy as np

# Generate sample data for linear regression
# y = 2*x + 1 + noise
np.random.seed(42)
x_data = np.random.randn(100).astype(np.float32)
y_data = 2 * x_data + 1 + 0.1 * np.random.randn(100).astype(np.float32)

# Define the model parameters
W = tf.Variable(tf.random.normal([1]), name='weight')
b = tf.Variable(tf.zeros([1]), name='bias')

# Define the linear regression model
def linear_regression(x):
    return W * x + b

# Define the loss function (Mean Squared Error)
def mean_squared_error(y_pred, y_true):
    return tf.reduce_mean(tf.square(y_pred - y_true))

# Define the optimizer
optimizer = tf.optimizers.SGD(learning_rate=0.01)

# Training function
def train_step(x, y):
    with tf.GradientTape() as tape:
        predictions = linear_regression(x)
        loss = mean_squared_error(predictions, y)
    
    # Compute gradients
    gradients = tape.gradient(loss, [W, b])
    
    # Update weights
    optimizer.apply_gradients(zip(gradients, [W, b]))
    
    return loss

# Training loop
print("Training started...")
for epoch in range(1000):
    loss = train_step(x_data, y_data)
    
    if (epoch + 1) % 100 == 0:
        print(f"Epoch: {epoch + 1}, Loss: {loss:.4f}, Weight: {W.numpy()[0]:.4f}, Bias: {b.numpy()[0]:.4f}")

print(f"\nFinal Results:")
print(f"Weight: {W.numpy()[0]:.4f} (Expected: 2.0)")
print(f"Bias: {b.numpy()[0]:.4f} (Expected: 1.0)")

# Save the model
model = tf.function(linear_regression)
tf.saved_model.save(model, 'linear_regression_model')
print("\nModel saved as 'linear_regression_model'")