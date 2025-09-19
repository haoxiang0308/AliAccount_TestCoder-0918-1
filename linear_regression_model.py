try:
    import tensorflow as tf
    import numpy as np
    import matplotlib.pyplot as plt
    tf_available = True
except ImportError as e:
    print(f"Required libraries not available: {e}")
    print("Please install them using: pip install tensorflow matplotlib")
    tf_available = False

if tf_available:
    # Generate sample data
    np.random.seed(42)
    X = np.random.randn(100, 1).astype(np.float32)
    y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)  # y = 2x + 1 + noise

    # Create TensorFlow model
    model = tf.keras.Sequential([
        tf.keras.layers.Dense(units=1, input_shape=[1])
    ])

    # Compile the model
    model.compile(
        optimizer='sgd',
        loss='mean_squared_error',
        metrics=['mae']
    )

    # Display model summary
    print("Model Summary:")
    model.summary()

    # Train the model
    print("\nTraining the model...")
    history = model.fit(X, y, epochs=100, verbose=0)

    # Evaluate the model
    loss, mae = model.evaluate(X, y, verbose=0)
    print(f"\nModel Evaluation - Loss: {loss:.4f}, MAE: {mae:.4f}")

    # Make predictions
    predictions = model.predict(X[:5])
    print("\nSample Predictions vs Actual:")
    for i in range(5):
        print(f"X: {X[i][0]:.2f}, Predicted: {predictions[i][0]:.2f}, Actual: {y[i][0]:.2f}")

    # Get model parameters
    weights, bias = model.layers[0].get_weights()
    print(f"\nLearned Parameters - Weight: {weights[0][0]:.4f}, Bias: {bias[0]:.4f}")
    print(f"True Parameters - Weight: 2.0, Bias: 1.0")

    # Plot results
    plt.figure(figsize=(10, 6))
    plt.scatter(X, y, label='Data')
    plt.plot(X, model.predict(X), color='red', label='Model Prediction')
    plt.xlabel('X')
    plt.ylabel('y')
    plt.title('Linear Regression with TensorFlow')
    plt.legend()
    plt.grid(True)
    plt.savefig('linear_regression_plot.png')
    print("\nPlot saved as 'linear_regression_plot.png'")
else:
    print("\nExiting as required libraries are not available.")