import queue
import threading
import time

class Crystal:
    """
    A class to manage a queue with thread-safe operations.
    It provides methods to add items, get items, check size, and close the queue.
    """

    def __init__(self):
        """
        Initializes the Crystal object with a queue and a closed flag.
        """
        self._queue = queue.Queue()
        self._closed = threading.Event()
        self._lock = threading.Lock()

    def put(self, item):
        """
        Adds an item to the queue.

        Args:
            item: The item to add.

        Raises:
            RuntimeError: If the queue is closed.
        """
        if self._closed.is_set():
            raise RuntimeError("Cannot put item: Crystal queue is closed.")
        self._queue.put(item)

    def get(self, timeout=None):
        """
        Gets an item from the queue.

        Args:
            timeout (float, optional): The maximum time to wait for an item. Defaults to None (infinite wait).

        Returns:
            The item retrieved from the queue.

        Raises:
            RuntimeError: If the queue is closed and empty.
        """
        if self._closed.is_set() and self._queue.empty():
            raise RuntimeError("Cannot get item: Crystal queue is closed and empty.")

        try:
            # Use a small internal timeout to periodically check if the queue is closed
            internal_timeout = min(timeout, 0.1) if timeout else 0.1
            while True:
                try:
                    item = self._queue.get(timeout=internal_timeout)
                    return item
                except queue.Empty:
                    if self._closed.is_set():
                        # Check again under lock to ensure it's still empty after closing
                        with self._lock:
                            if self._queue.empty():
                                raise RuntimeError("Cannot get item: Crystal queue is closed and empty.")
                    if timeout is not None:
                        timeout -= internal_timeout
                        if timeout <= 0:
                            raise queue.Empty
        except queue.Empty:
            raise queue.Empty("Timeout expired while waiting for item from Crystal queue.")


    def size(self):
        """
        Returns the current number of items in the queue.
        """
        return self._queue.qsize()

    def close(self):
        """
        Closes the queue. No more items can be added.
        Currently waiting or future `get` calls on an empty, closed queue will raise a RuntimeError.
        """
        self._closed.set()

    def is_closed(self):
        """
        Returns True if the queue is closed, False otherwise.
        """
        return self._closed.is_set()

if __name__ == "__main__":
    # Example usage of the Crystal class
    crystal_q = Crystal()

    # Producer function
    def producer(crystal, start, end):
        for i in range(start, end):
            print(f"Producer: Adding {i} to queue")
            crystal.put(i)
            time.sleep(0.5)
        print("Producer: Finished adding items.")

    # Consumer function
    def consumer(crystal, name):
        while not crystal.is_closed() or not crystal._queue.empty():
            try:
                item = crystal.get(timeout=1.0)
                print(f"Consumer {name}: Got {item} from queue")
            except RuntimeError:
                print(f"Consumer {name}: Queue is closed and empty, stopping.")
                break
            except queue.Empty:
                print(f"Consumer {name}: Timeout, checking if queue is closed...")
                continue
        print(f"Consumer {name}: Finished.")

    # Start producer and consumer threads
    producer_thread = threading.Thread(target=producer, args=(crystal_q, 1, 6))
    consumer_thread1 = threading.Thread(target=consumer, args=(crystal_q, "A"))
    consumer_thread2 = threading.Thread(target=consumer, args=(crystal_q, "B"))

    producer_thread.start()
    consumer_thread1.start()
    consumer_thread2.start()

    producer_thread.join()

    # Close the queue after producer finishes
    crystal_q.close()

    consumer_thread1.join()
    consumer_thread2.join()

    print("All threads finished. Final queue size:", crystal_q.size())
