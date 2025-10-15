import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string
import os

class BinaryClassifier(nn.Module):
    """
    A neural network model for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)  # First hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)  # Second hidden layer
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer (1 output for binary classification)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
        
    def forward(self, x):
        # First hidden layer with ReLU activation and batch norm
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch norm
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

# Generate a random filename
random_filename = create_random_filename()

# Get the model code as a string
model_code = '''import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A neural network model for binary classification.
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)  # First hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)  # Second hidden layer
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer (1 output for binary classification)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
        
    def forward(self, x):
        # First hidden layer with ReLU activation and batch norm
        x = F.relu(self.bn1(self.fc1(x)))
        x = self.dropout(x)
        
        # Second hidden layer with ReLU activation and batch norm
        x = F.relu(self.bn2(self.fc2(x)))
        x = self.dropout(x)
        
        # Output layer with sigmoid activation for binary classification
        x = torch.sigmoid(self.fc3(x))
        
        return x

# Example usage:
if __name__ == "__main__":
    # Create a model instance (assuming input size of 10 features)
    model = BinaryClassifier(input_size=10)
    
    print("Model architecture:")
    print(model)
    
    # Example of how to use the model
    sample_input = torch.randn(5, 10)  # Batch of 5 samples with 10 features each
    output = model(sample_input)
    print(f"\\\\nSample input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Save the model's state dict
    torch.save(model.state_dict(), "binary_classifier_weights.pth")
    print("\\\\nModel weights saved to 'binary_classifier_weights.pth'")
'''

# Write the model code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(model_code)

print(f"PyTorch neural network model for binary classification saved to: {random_filename}")