class Crystal:
    """
    A simple queue management class.
    """

    def __init__(self):
        self._queue = []

    def enqueue(self, item):
        """Adds an item to the end of the queue."""
        self._queue.append(item)

    def dequeue(self):
        """Removes and returns the item from the front of the queue."""
        if not self.is_empty():
            return self._queue.pop(0)
        else:
            raise IndexError("dequeue from an empty queue")

    def front(self):
        """Returns the item at the front of the queue without removing it."""
        if not self.is_empty():
            return self._queue[0]
        else:
            return None

    def is_empty(self):
        """Checks if the queue is empty."""
        return len(self._queue) == 0

    def size(self):
        """Returns the number of items in the queue."""
        return len(self._queue)


# Example usage:
if __name__ == "__main__":
    crystal = Crystal()
    crystal.enqueue("Element 1")
    crystal.enqueue("Element 2")
    print(f"Size: {crystal.size()}")
    print(f"Front item: {crystal.front()}")
    print(f"Dequeued: {crystal.dequeue()}")
    print(f"Is empty: {crystal.is_empty()}")