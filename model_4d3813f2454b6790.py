import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    It has an input layer, one hidden layer, and an output layer.
    """
    def __init__(self, input_size):
        super(BinaryClassifier, self).__init__()
        self.hidden = nn.Linear(input_size, 10)  # Hidden layer with 10 neurons
        self.output = nn.Linear(10, 1)           # Output layer for binary classification

    def forward(self, x):
        x = F.relu(self.hidden(x))  # Apply ReLU activation to hidden layer
        x = torch.sigmoid(self.output(x))  # Apply Sigmoid activation to output layer
        return x

# Example usage:
# model = BinaryClassifier(input_size=20)
# print(model)