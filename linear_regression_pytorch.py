import torch
import torch.nn as nn
import numpy as np

# Generate some sample data
np.random.seed(42)
X = np.random.randn(100, 1).astype(np.float32)
y = 2 * X + 1 + 0.1 * np.random.randn(100, 1).astype(np.float32)

# Convert to PyTorch tensors
X_tensor = torch.from_numpy(X)
y_tensor = torch.from_numpy(y)

# Define a simple linear regression model
class LinearRegressionModel(nn.Module):
    def __init__(self):
        super(LinearRegressionModel, self).__init__()
        self.linear = nn.Linear(1, 1)
        
    def forward(self, x):
        return self.linear(x)

# Create model instance
model = LinearRegressionModel()

# Define loss function and optimizer
criterion = nn.MSELoss()
optimizer = torch.optim.SGD(model.parameters(), lr=0.01)

# Train the model
print("Training the model...")
for epoch in range(100):
    # Forward pass
    y_pred = model(X_tensor)
    
    # Compute loss
    loss = criterion(y_pred, y_tensor)
    
    # Zero gradients, backward pass, update weights
    optimizer.zero_grad()
    loss.backward()
    optimizer.step()

print(f"Final loss: {loss.item():.6f}")

# Print model parameters
for name, param in model.named_parameters():
    if param.requires_grad:
        print(f'{name}: {param.data.squeeze().item():.4f}')

# Save the model
torch.save(model.state_dict(), 'linear_regression_model.pth')
print("Model saved as 'linear_regression_model.pth'")