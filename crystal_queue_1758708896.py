from collections import deque
import json

class Crystal:
    """
    A simple queue management class.
    """

    def __init__(self):
        self._queue = deque()

    def enqueue(self, item):
        """Add an item to the end of the queue."""
        self._queue.append(item)

    def dequeue(self):
        """Remove and return an item from the front of the queue."""
        if self.is_empty():
            raise IndexError("dequeue from an empty queue")
        return self._queue.popleft()

    def peek(self):
        """Return the item at the front of the queue without removing it."""
        if self.is_empty():
            raise IndexError("peek from an empty queue")
        return self._queue[0]

    def is_empty(self):
        """Check if the queue is empty."""
        return len(self._queue) == 0

    def size(self):
        """Return the number of items in the queue."""
        return len(self._queue)

    def to_json(self):
        """Return a JSON representation of the queue."""
        return json.dumps(list(self._queue))

    def from_json(self, json_str):
        """Load the queue from a JSON string."""
        data = json.loads(json_str)
        self._queue = deque(data)

    def __str__(self):
        """String representation of the queue."""
        return f"Crystal(queue={list(self._queue)})"

# Example usage:
if __name__ == "__main__":
    q = Crystal()
    q.enqueue("first")
    q.enqueue("second")
    q.enqueue("third")
    print(q)  # Crystal(queue=['first', 'second', 'third'])
    print(f"Size: {q.size()}")  # Size: 3
    print(f"Peek: {q.peek()}")  # Peek: first
    item = q.dequeue()
    print(f"Dequeued: {item}")  # Dequeued: first
    print(q)  # Crystal(queue=['second', 'third'])
    print(f"Is empty: {q.is_empty()}")  # Is empty: False
    print(f"JSON: {q.to_json()}") # JSON: [\"second\", \"third\"]