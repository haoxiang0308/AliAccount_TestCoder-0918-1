import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size=64):
        super(BinaryClassifier, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.fc2 = nn.Linear(hidden_size, hidden_size // 2)
        self.fc3 = nn.Linear(hidden_size // 2, 1)
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))
        return x

def create_model(input_size, hidden_size=64):
    """
    Creates and returns a binary classifier model.
    """
    model = BinaryClassifier(input_size, hidden_size)
    return model

# Example usage
if __name__ == "__main__":
    # Create a model with input size of 10 features
    model = create_model(input_size=10, hidden_size=64)
    
    # Example input tensor
    example_input = torch.randn(1, 10)
    
    # Forward pass
    output = model(example_input)
    print(f"Model output: {output.item():.4f}")
    print(f"Model architecture:\n{model}")
    
    # Save the model
    model_filename = "binary_classifier.pth"
    torch.save(model.state_dict(), model_filename)
    print(f"Model saved as {model_filename}")