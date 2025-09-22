class Crystal:
    """
    Класс Crystal для управления очередью (FIFO - First In, First Out).
    """

    def __init__(self):
        """Инициализирует пустую очередь."""
        self._items = []

    def enqueue(self, item):
        """
        Добавляет элемент в конец очереди.

        Args:
            item: Элемент для добавления в очередь.
        """
        self._items.append(item)

    def dequeue(self):
        """
        Удаляет и возвращает элемент из начала очереди.

        Returns:
            Элемент, который был первым добавлен в очередь.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно извлечь элемент из пустой очереди.")
        return self._items.pop(0)

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.

        Returns:
            True, если очередь пуста, иначе False.
        """
        return len(self._items) == 0

    def size(self):
        """
        Возвращает количество элементов в очереди.

        Returns:
            Целое число, представляющее количество элементов в очереди.
        """
        return len(self._items)

    def peek(self):
        """
        Возвращает элемент из начала очереди, не удаляя его.

        Returns:
            Элемент, который находится в начале очереди.

        Raises:
            IndexError: Если очередь пуста.
        """
        if self.is_empty():
            raise IndexError("Невозможно посмотреть элемент в пустой очереди.")
        return self._items[0]

    def __str__(self):
        """
        Возвращает строковое представление очереди.

        Returns:
            Строка, представляющая очередь.
        """
        return f"Crystal Queue({self._items})"


# Пример использования:
if __name__ == "__main__":
    q = Crystal()
    print(f"Очередь пуста? {q.is_empty()}")  # True

    q.enqueue("A")
    q.enqueue("B")
    q.enqueue(123)
    print(f"Очередь: {q}")  # Crystal Queue(['A', 'B', 123])
    print(f"Размер: {q.size()}")  # 3

    print(f"Первый элемент: {q.peek()}")  # A
    print(f"Извлечен: {q.dequeue()}")  # A
    print(f"Извлечен: {q.dequeue()}")  # B
    print(f"Очередь после извлечения: {q}")  # Crystal Queue([123])
    print(f"Очередь пуста? {q.is_empty()}")  # False