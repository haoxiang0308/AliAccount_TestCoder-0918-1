import queue
import threading
import time

class Crystal:
    """
    A simple class to manage a queue with thread-safe operations.
    It allows adding items (enqueue), removing items (dequeue), and checking the size.
    """

    def __init__(self):
        self._queue = queue.Queue()
        self._lock = threading.Lock()

    def enqueue(self, item):
        """Add an item to the back of the queue."""
        with self._lock:
            self._queue.put(item)
            print(f"Enqueued: {item}")

    def dequeue(self):
        """Remove and return an item from the front of the queue. Returns None if the queue is empty."""
        with self._lock:
            try:
                item = self._queue.get_nowait()
                print(f"Dequeued: {item}")
                return item
            except queue.Empty:
                print("Queue is empty, cannot dequeue.")
                return None

    def size(self):
        """Return the current size of the queue."""
        with self._lock:
            current_size = self._queue.qsize()
            print(f"Current queue size: {current_size}")
            return current_size

    def is_empty(self):
        """Check if the queue is empty."""
        with self._lock:
            is_empty = self._queue.empty()
            print(f"Is queue empty? {is_empty}")
            return is_empty

# Example usage:
if __name__ == "__main__":
    crystal_queue = Crystal()

    crystal_queue.enqueue("Item 1")
    crystal_queue.enqueue("Item 2")
    crystal_queue.size()
    crystal_queue.dequeue()
    crystal_queue.size()
    crystal_queue.is_empty()
    crystal_queue.dequeue()
    crystal_queue.is_empty()
    crystal_queue.dequeue() # Attempt to dequeue from an empty queue