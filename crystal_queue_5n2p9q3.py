class Crystal:
    """
    Класс Crystal для управления очередью.
    """

    def __init__(self):
        """
        Инициализирует пустую очередь.
        """
        self._queue = []

    def enqueue(self, item):
        """
        Добавляет элемент в конец очереди.

        :param item: Элемент для добавления.
        """
        self._queue.append(item)

    def dequeue(self):
        """
        Удаляет и возвращает элемент из начала очереди.

        :return: Первый элемент очереди или None, если очередь пуста.
        """
        if self.is_empty():
            return None
        return self._queue.pop(0)

    def front(self):
        """
        Возвращает первый элемент очереди без его удаления.

        :return: Первый элемент очереди или None, если очередь пуста.
        """
        if self.is_empty():
            return None
        return self._queue[0]

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.

        :return: True, если очередь пуста, иначе False.
        """
        return len(self._queue) == 0

    def size(self):
        """
        Возвращает размер очереди.

        :return: Количество элементов в очереди.
        """
        return len(self._queue)


# Пример использования
if __name__ == "__main__":
    cq = Crystal()

    print("Добавляем элементы 10 и 20")
    cq.enqueue(10)
    cq.enqueue(20)

    print(f"Размер очереди: {cq.size()}")
    print(f"Первый элемент: {cq.front()}")

    print(f"Извлекаем элемент: {cq.dequeue()}")
    print(f"Первый элемент после извлечения: {cq.front()}")
    print(f"Размер очереди: {cq.size()}")
    print(f"Очередь пуста? {cq.is_empty()}")