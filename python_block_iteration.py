#!/usr/bin/env python3

# Create an example list
array = [1, 2, 3, 4, 5, "hello", "world", 3.14]

# Using a lambda function (similar to a Ruby block) to iterate through the list
print("Iterating through list using a function:")
for element in array:
    print(element)

print("\nUsing enumerate to get index (similar to each_with_index):")
for index, element in enumerate(array):
    print(f"Index {index}: {element}")

print("\nUsing list comprehension to transform elements (similar to map):")
# Filter numeric values and square them
numeric_values = [x for x in array if isinstance(x, (int, float))]
squared_numbers = [x * x for x in numeric_values]
print(f"Squared numbers: {squared_numbers}")

# Using map function (another way similar to Ruby's map)
print("\nUsing map function:")
def print_element(element):
    return element

result = list(map(print_element, array))
for item in result:
    print(item)