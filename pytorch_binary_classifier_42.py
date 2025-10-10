import torch
import torch.nn as nn
import torch.optim as optim

# Define the neural network model
class BinaryClassifier(nn.Module):
    def __init__(self, input_size, hidden_size1=64, hidden_size2=32):
        super(BinaryClassifier, self).__init__()
        # First hidden layer
        self.fc1 = nn.Linear(input_size, hidden_size1)
        # Second hidden layer
        self.fc2 = nn.Linear(hidden_size1, hidden_size2)
        # Output layer
        self.fc3 = nn.Linear(hidden_size2, 1)
        # Activation function
        self.relu = nn.ReLU()
        # Sigmoid for final binary output
        self.sigmoid = nn.Sigmoid()

    def forward(self, x):
        x = self.relu(self.fc1(x))
        x = self.relu(self.fc2(x))
        x = self.sigmoid(self.fc3(x))
        return x

# Example usage
if __name__ == "__main__":
    # Define model parameters
    INPUT_SIZE = 10  # Number of features
    model = BinaryClassifier(input_size=INPUT_SIZE)

    # Loss and optimizer
    criterion = nn.BCELoss()
    optimizer = optim.Adam(model.parameters(), lr=0.001)

    print(f"Model created: {model}")
    print(f"Criterion: {criterion}")
    print(f"Optimizer: {optimizer}")