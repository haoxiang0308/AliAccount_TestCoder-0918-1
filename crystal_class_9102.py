class Crystal:
    """
    A class to manage a queue of items, representing 'crystals'.
    """

    def __init__(self):
        """Initializes an empty queue."""
        self._queue = []

    def add(self, item):
        """
        Adds an item to the back of the queue.

        Args:
            item: The item to add.
        """
        self._queue.append(item)

    def remove(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item that was at the front of the queue, or None if the queue was empty.
        """
        if not self.is_empty():
            return self._queue.pop(0)
        return None

    def peek(self):
        """
        Returns the item at the front of the queue without removing it.

        Returns:
            The item at the front of the queue, or None if the queue is empty.
        """
        if not self.is_empty():
            return self._queue[0]
        return None

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            True if the queue is empty, False otherwise.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            The size of the queue.
        """
        return len(self._queue)

    def display(self):
        """
        Prints the current state of the queue.
        """
        print(f"Crystal Queue: {self._queue}")

# Example usage:
if __name__ == "__main__":
    my_crystal_queue = Crystal()

    my_crystal_queue.add("Red Crystal")
    my_crystal_queue.add("Blue Crystal")
    my_crystal_queue.add("Green Crystal")
    my_crystal_queue.display()  # Crystal Queue: ['Red Crystal', 'Blue Crystal', 'Green Crystal']

    print(f"Removed: {my_crystal_queue.remove()}")  # Removed: Red Crystal
    my_crystal_queue.display()  # Crystal Queue: ['Blue Crystal', 'Green Crystal']

    print(f"Peek front: {my_crystal_queue.peek()}")  # Peek front: Blue Crystal
    print(f"Queue size: {my_crystal_queue.size()}")  # Queue size: 2
    print(f"Is empty: {my_crystal_queue.is_empty()}")  # Is empty: False

    my_crystal_queue.remove()
    my_crystal_queue.remove()
    print(f"Is empty after removing all: {my_crystal_queue.is_empty()}")  # Is empty after removing all: True