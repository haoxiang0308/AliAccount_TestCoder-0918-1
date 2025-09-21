import torch
import torch.nn as nn
import torch.nn.functional as F

class BinaryClassifier(nn.Module):
    """
    A simple neural network for binary classification.
    """
    def __init__(self, input_size, hidden_size1, hidden_size2):
        super(BinaryClassifier, self).__init__()
        # Define the layers
        self.fc1 = nn.Linear(input_size, hidden_size1)
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        self.fc3 = nn.Linear(hidden_size2, 1)
        
        # Dropout for regularization
        self.dropout = nn.Dropout(0.2)
        
    def forward(self, x):
        # Forward pass through the network
        x = F.relu(self.fc1(x))
        x = self.dropout(x)
        x = F.relu(self.fc2(x))
        x = self.dropout(x)
        x = self.fc3(x)
        # Sigmoid activation for binary classification
        x = torch.sigmoid(x)
        return x

# Example usage:
# model = BinaryClassifier(input_size=20, hidden_size1=16, hidden_size2=8)
# criterion = nn.BCELoss()
# optimizer = torch.optim.Adam(model.parameters(), lr=0.001)

if __name__ == "__main__":
    # Create a sample model
    model = BinaryClassifier(input_size=20, hidden_size1=16, hidden_size2=8)
    print(model)
    
    # Create sample input data
    sample_input = torch.randn(5, 20)  # batch_size=5, input_size=20
    
    # Forward pass
    with torch.no_grad():
        output = model(sample_input)
        print(f"Input shape: {sample_input.shape}")
        print(f"Output shape: {output.shape}")
        print(f"Sample output: {output}")