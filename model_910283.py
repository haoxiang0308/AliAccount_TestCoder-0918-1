import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple feedforward neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.5):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Single output for binary classification
        self.dropout = nn.Dropout(dropout_rate)
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = self.fc3(x)
        output = self.sigmoid(x)  # Sigmoid activation for probability output
        return output

# Example usage:
if __name__ == "__main__":
    # Define model parameters
    INPUT_SIZE = 10  # Example: 10 features
    model = BinaryClassifier(input_size=INPUT_SIZE)

    # Print model architecture
    print(model)

    # Example forward pass with a batch of 5 samples
    sample_input = torch.randn(5, INPUT_SIZE)
    with torch.no_grad():
        predictions = model(sample_input)
    print(f"Sample Input Shape: {sample_input.shape}")
    print(f"Output Shape: {predictions.shape}")
    print(f"Sample Output (Probabilities): {predictions.flatten()}")