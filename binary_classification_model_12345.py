import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassificationNet(nn.Module):
    """
    A simple neural network for binary classification tasks.
    """
    def __init__(self, input_size, hidden_size1, hidden_size2):
        """
        Initialize the network layers.
        
        Args:
            input_size (int): Number of input features
            hidden_size1 (int): Number of neurons in the first hidden layer
            hidden_size2 (int): Number of neurons in the second hidden layer
        """
        super(BinaryClassificationNet, self).__init__()
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        """
        Forward pass through the network.
        
        Args:
            x (Tensor): Input tensor of shape (batch_size, input_size)
            
        Returns:
            Tensor: Output tensor of shape (batch_size, 1) with values between 0 and 1
        """
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = torch.sigmoid(self.fc3(x))
        return x

# Example usage:
if __name__ == "__main__":
    # Create a model instance
    model = BinaryClassificationNet(input_size=20, hidden_size1=16, hidden_size2=8)
    
    # Create a sample input batch of 5 samples with 20 features each
    sample_input = torch.randn(5, 20)
    
    # Forward pass
    output = model(sample_input)
    
    print(f"Input shape: {sample_input.shape}")
    print(f"Output shape: {output.shape}")
    print(f"Sample outputs: {output.detach().numpy().flatten()}")