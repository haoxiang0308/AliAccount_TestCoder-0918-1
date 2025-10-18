import torch
import torch.nn as nn
import torch.nn.functional as F
import random
import string
import os

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
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
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"binary_classifier_{random_string}.py"

# Generate a random filename
random_filename = create_random_filename()

# Define the model code as a string
model_code = '''import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
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

# Example usage:
if __name__ == "__main__":
    # Create a model instance (for example, with 10 input features)
    input_size = 10
    model = BinaryClassifier(input_size=input_size)
    
    print(f"Model architecture:\\n{model}")
    
    # Generate example input
    example_input = torch.randn(5, input_size)  # Batch of 5 samples with 10 features each
    output = model(example_input)
    print(f"Example output shape: {output.shape}")
    print(f"Example output (probabilities): {output.flatten()}")
    
    # Save the model's state dict
    torch.save(model.state_dict(), "binary_classifier_model.pth")
    print("Model saved as binary_classifier_model.pth")
'''

# Write the model code to the randomly named file
with open(random_filename, 'w') as f:
    f.write(model_code)

print(f"PyTorch binary classification model saved to: {random_filename}")