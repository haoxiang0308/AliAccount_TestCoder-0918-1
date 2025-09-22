import random
import string


class Crystal:
    """
    A class to manage a queue data structure.
    """

    def __init__(self):
        """
        Initializes an empty queue.
        """
        self.queue = []

    def enqueue(self, item):
        """
        Adds an item to the end of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self.queue.append(item)

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item removed from the front of the queue.

        Raises:
            IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("dequeue from an empty queue")
        return self.queue.pop(0)

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            bool: True if the queue is empty, False otherwise.
        """
        return len(self.queue) == 0

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            int: The number of items in the queue.
        """
        return len(self.queue)

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        Returns:
            The item at the front of the queue.

        Raises:
            IndexError: If the queue is empty.
        """
        if self.is_empty():
            raise IndexError("peek from an empty queue")
        return self.queue[0]


def generate_random_filename(extension=".py"):
    """
    Generates a random filename with the given extension.

    Args:
        extension (str): The file extension (default is ".py").

    Returns:
        str: A random filename.
    """
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{extension}"


# Example usage:
if __name__ == "__main__":
    # Generate a random filename
    filename = generate_random_filename()
    print(f"Queue class saved to: {filename}")

    # Save the Crystal class to the file
    with open(filename, 'w') as f:
        f.write("class Crystal:\n")
        f.write("    \"\"\"\n")
        f.write("    A class to manage a queue data structure.\n")
        f.write("    \"\"\"\n\n")
        f.write("    def __init__(self):\n")
        f.write("        \"\"\"\n")
        f.write("        Initializes an empty queue.\n")
        f.write("        \"\"\"\n")
        f.write("        self.queue = []\n\n")
        f.write("    def enqueue(self, item):\n")
        f.write("        \"\"\"\n")
        f.write("        Adds an item to the end of the queue.\n\n")
        f.write("        Args:\n")
        f.write("            item: The item to be added to the queue.\n")
        f.write("        \"\"\"\n")
        f.write("        self.queue.append(item)\n\n")
        f.write("    def dequeue(self):\n")
        f.write("        \"\"\"\n")
        f.write("        Removes and returns the item from the front of the queue.\n\n")
        f.write("        Returns:\n")
        f.write("            The item removed from the front of the queue.\n\n")
        f.write("        Raises:\n")
        f.write("            IndexError: If the queue is empty.\n")
        f.write("        \"\"\"\n")
        f.write("        if self.is_empty():\n")
        f.write("            raise IndexError(\"dequeue from an empty queue\")\n")
        f.write("        return self.queue.pop(0)\n\n")
        f.write("    def is_empty(self):\n")
        f.write("        \"\"\"\n")
        f.write("        Checks if the queue is empty.\n\n")
        f.write("        Returns:\n")
        f.write("            bool: True if the queue is empty, False otherwise.\n")
        f.write("        \"\"\"\n")
        f.write("        return len(self.queue) == 0\n\n")
        f.write("    def size(self):\n")
        f.write("        \"\"\"\n")
        f.write("        Returns the number of items in the queue.\n\n")
        f.write("        Returns:\n")
        f.write("            int: The number of items in the queue.\n")
        f.write("        \"\"\"\n")
        f.write("        return len(self.queue)\n\n")
        f.write("    def peek(self):\n")
        f.write("        \"\"\"\n")
        f.write("        Returns the item at the front of the queue without removing it.\n\n")
        f.write("        Returns:\n")
        f.write("            The item at the front of the queue.\n\n")
        f.write("        Raises:\n")
        f.write("            IndexError: If the queue is empty.\n")
        f.write("        \"\"\"\n")
        f.write("        if self.is_empty():\n")
        f.write("            raise IndexError(\"peek from an empty queue\")\n")
        f.write("        return self.queue[0]\n")