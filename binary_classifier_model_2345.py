import torch
import torch.nn as nn
import torch.optim as optim
import numpy as np

# Define the neural network model
class BinaryClassifier(nn.Module):
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, 128)
        self.relu1 = nn.ReLU()
        self.dropout1 = nn.Dropout(0.2)
        self.fc2 = nn.Linear(128, 64)
        self.relu2 = nn.ReLU()
        self.dropout2 = nn.Dropout(0.2)
        self.fc3 = nn.Linear(64, 1)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu1(x)
        x = self.dropout1(x)
        x = self.fc2(x)
        x = self.relu2(x)
        x = self.dropout2(x)
        x = self.fc3(x)
        x = self.sigmoid(x)
        return x

# Example usage
if __name__ == "__main__":
    # Example: 10 features
    input_size = 10
    model = BinaryClassifier(input_size)
    
    # Example input tensor
    example_input = torch.randn(1, input_size)
    
    # Forward pass
    output = model(example_input)
    print(f"Model output (probability): {output.item():.4f}")
    
    # Print model architecture
    print("\nModel Architecture:")
    print(model)