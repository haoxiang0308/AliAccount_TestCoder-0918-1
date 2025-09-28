class Crystal:
    """
    A simple queue management class.
    """

    def __init__(self):
        """Initializes an empty queue."""
        self._queue = []

    def enqueue(self, item):
        """Adds an item to the end of the queue."""
        self._queue.append(item)

    def dequeue(self):
        """Removes and returns the item from the front of the queue.
        Raises an IndexError if the queue is empty.
        """
        if self.is_empty():
            raise IndexError("dequeue from an empty queue")
        return self._queue.pop(0)

    def is_empty(self):
        """Checks if the queue is empty."""
        return len(self._queue) == 0

    def size(self):
        """Returns the number of items in the queue."""
        return len(self._queue)

    def peek(self):
        """Returns the item at the front of the queue without removing it.
        Raises an IndexError if the queue is empty.
        """
        if self.is_empty():
            raise IndexError("peek from an empty queue")
        return self._queue[0]


# Example usage:
if __name__ == "__main__":
    q = Crystal()
    q.enqueue(1)
    q.enqueue(2)
    q.enqueue(3)
    print(f"Queue size: {q.size()}")
    print(f"Front item: {q.peek()}")
    print(f"Dequeued item: {q.dequeue()}")
    print(f"Queue size after dequeue: {q.size()}")
    print(f"Is queue empty? {q.is_empty()}")