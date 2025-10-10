import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    It consists of an input layer, two hidden layers, and an output layer.
    ReLU activation is used for hidden layers, and Sigmoid for the output.
    """
    def __init__(self, input_size: int, hidden_size_1: int = 128, hidden_size_2: int = 64):
        """
        Initializes the layers of the neural network.

        Args:
            input_size (int): Number of input features.
            hidden_size_1 (int): Number of neurons in the first hidden layer. Default is 128.
            hidden_size_2 (int): Number of neurons in the second hidden layer. Default is 64.
        """
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size_1)
        self.fc2 = nn.Linear(hidden_size_1, hidden_size_2)
        self.fc3 = nn.Linear(hidden_size_2, 1)  # Single output for binary classification
        self.dropout = nn.Dropout(0.2)

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        """
        Defines the forward pass of the model.

        Args:
            x (torch.Tensor): Input tensor.

        Returns:
            torch.Tensor: Output probabilities for the positive class (after sigmoid).
        """
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))
        return x

# Example usage:
# model = BinaryClassifier(input_size=10)
# print(model)
# sample_input = torch.randn(1, 10)
# output = model(sample_input)
# print(f"Model output probability: {output.item():.4f}")