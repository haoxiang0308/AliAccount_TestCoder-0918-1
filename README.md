# Linear Regression with TensorFlow

This project demonstrates a simple linear regression model implemented using TensorFlow.

## Files

- `linear_regression_model.py`: The main script that creates and trains a linear regression model
- `linear_regression_plot.png`: The visualization of the model's predictions (generated when the script runs successfully)

## Requirements

- Python 3.x
- TensorFlow
- NumPy
- Matplotlib

## Installation

Install the required packages using pip:

```bash
pip install tensorflow matplotlib
```

## Usage

Run the script with:

```bash
python linear_regression_model.py
```

The script will:
1. Generate sample data with a linear relationship
2. Create a TensorFlow model with one Dense layer
3. Train the model on the generated data
4. Evaluate the model's performance
5. Display sample predictions compared to actual values
6. Show the learned parameters vs. the true parameters
7. Save a plot of the data and model predictions as `linear_regression_plot.png`

## Model Details

The model learns to approximate the relationship `y = 2x + 1` with some added noise. It uses:
- A single Dense layer with one unit
- Stochastic Gradient Descent (SGD) optimizer
- Mean Squared Error (MSE) loss function
- Mean Absolute Error (MAE) as a metric

The script trains for 100 epochs and then evaluates the final model performance.