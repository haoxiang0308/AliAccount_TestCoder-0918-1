import tensorflow as tf
import numpy as np

# Create a simple linear regression model using TensorFlow
# This script creates a model that learns y = w*x + b

# Set random seed for reproducibility
tf.random.set_seed(42)
np.random.seed(42)

# Generate synthetic data: y = 3*x + 2 + noise
X = np.random.randn(100, 1).astype(np.float32)
true_w, true_b = 3.0, 2.0
y = true_w * X + true_b + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Define the model using tf.Variable for weights and bias
w = tf.Variable(tf.random.normal([1, 1]), name='weight')
b = tf.Variable(tf.zeros([1]), name='bias')

# Define the linear model function
def linear_model(x):
    return tf.matmul(x, w) + b

# Define the loss function (mean squared error)
def loss_fn(y_true, y_pred):
    return tf.reduce_mean(tf.square(y_true - y_pred))

# Define the optimizer
optimizer = tf.optimizers.Adam(learning_rate=0.01)

# Training loop
print("Training the linear regression model...")
for epoch in range(50):
    with tf.GradientTape() as tape:
        predictions = linear_model(X)
        loss = loss_fn(y, predictions)
    
    # Compute gradients
    gradients = tape.gradient(loss, [w, b])
    
    # Update weights
    optimizer.apply_gradients(zip(gradients, [w, b]))
    
    if epoch % 10 == 0:
        print(f"Epoch {epoch}, Loss: {loss:.4f}")

# Final results
final_loss = loss_fn(y, linear_model(X))
print(f"\nTraining completed!")
print(f"Final loss: {final_loss:.4f}")
print(f"Learned weight: {w.numpy()[0,0]:.3f} (true: {true_w})")
print(f"Learned bias: {b.numpy()[0]:.3f} (true: {true_b})")

# Test with a few samples
test_predictions = linear_model(X[:5])
print(f"\nSample predictions vs actual values:")
for i in range(5):
    print(f"Input: {X[i][0]:.3f}, Predicted: {test_predictions[i][0]:.3f}, Actual: {y[i][0]:.3f}")

print(f"\nTensorFlow linear regression model built and trained successfully!")