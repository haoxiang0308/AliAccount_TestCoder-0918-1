"""
A class to manage a queue, metaphorically named Crystal.
"""

from collections import deque
import random
import string

class Crystal:
    """
    A class that manages a queue using a deque (double-ended queue).
    It's named Crystal, perhaps because crystals can have ordered, queue-like structures.
    """

    def __init__(self, name=None):
        """
        Initializes the Crystal (queue manager).

        Args:
            name (str, optional): A name for the Crystal instance.
                                  If not provided, a random name is generated.
        """
        if name is None:
            random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=8))
            self.name = f"Crystal_{random_name}"
        else:
            self.name = name
        self._queue = deque()

    def enqueue(self, item):
        """
        Adds an item to the back of the queue.

        Args:
            item: The item to add.
        """
        self._queue.append(item)
        print(f"Item '{item}' added to the queue '{self.name}'.")

    def dequeue(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item that was at the front of the queue, or None if the queue is empty.
        """
        if not self.is_empty():
            item = self._queue.popleft()
            print(f"Item '{item}' removed from the front of the queue '{self.name}'.")
            return item
        else:
            print(f"Cannot dequeue from queue '{self.name}' as it is empty.")
            return None

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        Returns:
            The item at the front of the queue, or None if the queue is empty.
        """
        if not self.is_empty():
            item = self._queue[0]
            print(f"Front item of queue '{self.name}' is '{item}'.")
            return item
        else:
            print(f"Queue '{self.name}' is empty. Nothing to peek.")
            return None

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            True if the queue is empty, False otherwise.
        """
        empty_status = len(self._queue) == 0
        print(f"Queue '{self.name}' is empty: {empty_status}")
        return empty_status

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            The size of the queue.
        """
        queue_size = len(self._queue)
        print(f"Size of queue '{self.name}' is {queue_size}.")
        return queue_size

    def display(self):
        """
        Displays the current state of the queue.
        """
        print(f"Current state of queue '{self.name}': {list(self._queue)}")


# Example usage:
if __name__ == "__main__":
    # Create a Crystal instance with a random name
    crystal = Crystal()
    print(f"Created Crystal instance named: {crystal.name}")

    # Perform some operations
    crystal.enqueue("First")
    crystal.enqueue("Second")
    crystal.enqueue("Third")
    crystal.display()

    crystal.dequeue()
    crystal.peek()
    crystal.display()

    crystal.dequeue()
    crystal.dequeue()
    crystal.dequeue()  # Try to dequeue from an empty queue

    crystal.is_empty()