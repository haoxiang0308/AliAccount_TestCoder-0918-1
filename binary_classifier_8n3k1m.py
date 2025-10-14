import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    It consists of two fully connected layers with a dropout layer in between.
    """
    def __init__(self, input_size=10):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, 16)
        self.dropout = nn.Dropout(0.2)
        self.fc2 = nn.Linear(16, 1)

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc2(x))
        return x

# Example usage:
# model = BinaryClassifier(input_size=20)
# print(model)
# sample_input = torch.randn(1, 20)
# output = model(sample_input)
# print(f"Model output: {output.item():.4f}")