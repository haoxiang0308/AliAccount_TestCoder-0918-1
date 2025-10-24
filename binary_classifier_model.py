import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A PyTorch neural network model for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer for binary classification
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # First hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch normalization
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

def create_random_filename():
    """Generate a random filename for the model file."""
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"model_{random_string}.py"

if __name__ == "__main__":
    # Example usage
    input_size = 10  # Number of input features
    model = BinaryClassifier(input_size)
    
    print(f"Model created with input size: {input_size}")
    print(f"Model architecture: {model}")
    
    # Create a sample input tensor
    sample_input = torch.randn(5, input_size)  # Batch size of 5
    output = model(sample_input)
    print(f"Sample input shape: {sample_input.shape}")
    print(f"Sample output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Save this model to a randomly named file
    random_filename = create_random_filename()
    print(f"\nThis model definition would be saved to: {random_filename}")