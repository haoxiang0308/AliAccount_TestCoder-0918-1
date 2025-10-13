class Crystal:
    """
    Класс Crystal для управления очередью.
    """
    def __init__(self):
        """Инициализирует пустую очередь."""
        self._queue = []

    def enqueue(self, item):
        """Добавляет элемент в конец очереди."""
        self._queue.append(item)

    def dequeue(self):
        """Удаляет и возвращает элемент из начала очереди."""
        if self.is_empty():
            raise IndexError("dequeue from empty queue")
        return self._queue.pop(0)

    def front(self):
        """Возвращает элемент из начала очереди без удаления."""
        if self.is_empty():
            raise IndexError("front from empty queue")
        return self._queue[0]

    def is_empty(self):
        """Проверяет, пуста ли очередь."""
        return len(self._queue) == 0

    def size(self):
        """Возвращает размер очереди."""
        return len(self._queue)
