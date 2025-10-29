import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification using PyTorch
    """
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32, dropout_rate=0.2):
        super(BinaryClassifier, self).__init__()
        
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)  # First hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)  # Second hidden layer
        self.fc3 = nn.Linear(hidden_size2, 1)  # Output layer (1 output for binary classification)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(dropout_rate)
        
        # Batch normalization for faster training
        self.bn1 = nn.BatchNorm1d(hidden_size1)
        self.bn2 = nn.BatchNorm1d(hidden_size2)
    
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))  # Apply ReLU activation after first layer
        x = self.bn1(x)  # Apply batch normalization
        x = F.relu(self.fc2(x))  # Apply ReLU activation after second layer
        x = self.bn2(x)  # Apply batch normalization
        x = self.dropout(x)  # Apply dropout
        x = torch.sigmoid(self.fc3(x))  # Sigmoid activation for binary classification output
        return x

# Example usage:
if __name__ == "__main__":
    # Create an instance of the model (assuming input size of 10 features)
    model = BinaryClassifier(input_size=10)
    
    # Print the model architecture
    print(model)
    
    # Example of how to use the model for a forward pass
    sample_input = torch.randn(5, 10)  # Batch of 5 samples with 10 features each
    output = model(sample_input)
    print(f"Output shape: {output.shape}")
    print(f"Sample output: {output.flatten()}")
    
    # Example of how to save the model
    torch.save(model.state_dict(), "binary_classifier.pth")
    print("Model saved successfully!")