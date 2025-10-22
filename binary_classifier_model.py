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
        self.fc1 = nn.Linear(input_size, hidden_size1)  # First hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)  # Second hidden layer
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer (1 output for binary classification)
        
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

def create_model(input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
    """
    Function to create and return a binary classifier model.
    """
    model = BinaryClassifier(
        input_size=input_size,
        hidden_size1=hidden_size1,
        hidden_size2=hidden_size2,
        dropout_rate=dropout_rate
    )
    return model

# Example usage
if __name__ == "__main__":
    # Create a model for binary classification with input size of 10 features
    input_size = 10
    model = create_model(input_size)
    
    # Print the model architecture
    print("Model Architecture:")
    print(model)
    
    # Example of how to use the model
    sample_input = torch.randn(5, input_size)  # Batch of 5 samples with 10 features each
    output = model(sample_input)
    print(f"\nInput shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Output values (probabilities): {output.flatten()}")
    
    # Show model parameters
    total_params = sum(p.numel() for p in model.parameters())
    trainable_params = sum(p.numel() for p in model.parameters() if p.requires_grad)
    print(f"\nTotal parameters: {total_params}")
    print(f"Trainable parameters: {trainable_params}")