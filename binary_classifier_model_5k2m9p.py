import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple feedforward neural network for binary classification.
    It takes a 10-dimensional input vector and outputs a single logit
    representing the probability of the positive class (after a sigmoid).
    """
    def __init__(self):
        super(BinaryClassifier, self).__init__()
        # Input layer: 10 features -> 64 hidden units
        self.fc1 = nn.Linear(10, 64)
        # Hidden layer: 64 -> 32
        self.fc2 = nn.Linear(64, 32)
        # Hidden layer: 32 -> 16
        self.fc3 = nn.Linear(32, 16)
        # Output layer: 16 -> 1 (single logit for binary classification)
        self.fc4 = nn.Linear(16, 1)
        # Dropout layer for regularization
        self.dropout = nn.Dropout(p=0.2)

    def forward(self, x):
        # Apply ReLU activation after the first linear layer
        x = F.relu(self.fc1(x))
        # Apply dropout
        x = self.dropout(x)
        # Apply ReLU activation after the second linear layer
        x = F.relu(self.fc2(x))
        # Apply dropout
        x = self.dropout(x)
        # Apply ReLU activation after the third linear layer
        x = F.relu(self.fc3(x))
        # Apply dropout
        x = self.dropout(x)
        # Final output layer (no activation here, sigmoid is applied in the loss function)
        x = self.fc4(x)
        return x

# Example usage:
# model = BinaryClassifier()
# print(model)