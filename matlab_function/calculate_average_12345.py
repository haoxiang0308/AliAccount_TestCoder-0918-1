def calculate_average(numbers):
    """
    Calculates the average of a list of numbers.

    Args:
        numbers: A list of numeric values.

    Returns:
        The average of the numbers, or None if the list is empty.
    """
    if not numbers:
        print("Warning: Cannot calculate average of an empty list.")
        return None
    total = sum(numbers)
    count = len(numbers)
    average = total / count
    return average

# Example usage
if __name__ == "__main__":
    sample_data = [10, 20, 30, 40, 50]
    avg = calculate_average(sample_data)
    print(f"The average of {sample_data} is {avg}")