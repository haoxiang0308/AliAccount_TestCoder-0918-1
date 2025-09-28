import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    
    This model takes an input tensor of size (batch_size, input_dim) and outputs
    a tensor of size (batch_size, 1) with logits for the positive class.
    """
    def __init__(self, input_dim: int, hidden_dim: int = 64):
        super(BinaryClassifier, self).__init__()
        # First hidden layer
        self.fc1 = nn.Linear(input_dim, hidden_dim)
        # Second hidden layer
        self.fc2 = nn.Linear(hidden_dim, hidden_dim)
        # Output layer
        self.fc3 = nn.Linear(hidden_dim, 1)
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        # Apply ReLU activation to the first layer
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        
        # Apply ReLU activation to the second layer
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        
        # Output layer (logits)
        x = self.fc3(x)
        return x

# Example usage:
# model = BinaryClassifier(input_dim=10)
# print(model)