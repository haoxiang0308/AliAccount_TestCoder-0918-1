import collections

class Crystal:
    """
    A class to manage a queue data structure.
    """

    def __init__(self):
        """
        Initializes an empty queue using collections.deque for efficiency.
        """
        self._queue = collections.deque()

    def enqueue(self, item):
        """
        Adds an item to the end of the queue.

        Args:
            item: The item to be added to the queue.
        """
        self._queue.append(item)

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
        return self._queue.popleft()

    def is_empty(self):
        """
        Checks if the queue is empty.

        Returns:
            bool: True if the queue is empty, False otherwise.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Returns the number of items in the queue.

        Returns:
            int: The number of items in the queue.
        """
        return len(self._queue)

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
        return self._queue[0]

    def __str__(self):
        """
        Returns a string representation of the queue.

        Returns:
            str: A string representation of the queue.
        """
        return f"Crystal Queue({list(self._queue)})"

# Example usage:
# if __name__ == "__main__":
#     q = Crystal()
#     q.enqueue(1)
#     q.enqueue(2)
#     q.enqueue("three")
#     print(q)  # Crystal Queue([1, 2, 'three'])
#     print(q.dequeue())  # 1
#     print(q.peek())     # 2
#     print(q.size())     # 2
#     print(q.is_empty()) # False