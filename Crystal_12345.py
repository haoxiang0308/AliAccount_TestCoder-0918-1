"""
A class to manage a queue.
"""

import queue


class Crystal:
    """
    A class to manage a queue using Python's built-in queue module.
    """

    def __init__(self):
        """
        Initializes the Crystal instance with an empty queue.
        """
        self._queue = queue.Queue()

    def add(self, item):
        """
        Adds an item to the end of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self._queue.put(item)

    def get(self):
        """
        Removes and returns the item from the front of the queue.

        Returns:
            The item removed from the front of the queue.

        Raises:
            queue.Empty: If the queue is empty.
        """
        try:
            return self._queue.get_nowait()
        except queue.Empty:
            print("Queue is empty!")
            return None

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            True if the queue is empty, False otherwise.
        """
        return self._queue.empty()

    def size(self):
        """
        Returns the size of the queue.

        Returns:
            The number of items currently in the queue.
        """
        return self._queue.qsize()
