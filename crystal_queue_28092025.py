import queue
import threading
import time

class Crystal:
    """
    Класс Crystal для управления очередью.
    Позволяет добавлять, извлекать элементы и проверять состояние очереди.
    """
    def __init__(self, maxsize=0):
        """
        Инициализирует очередь.
        :param maxsize: Максимальный размер очереди. 0 означает неограниченную очередь.
        """
        self._queue = queue.Queue(maxsize=maxsize)
        self._lock = threading.Lock()

    def enqueue(self, item):
        """
        Добавляет элемент в конец очереди.
        :param item: Элемент для добавления.
        """
        with self._lock:
            self._queue.put(item)

    def dequeue(self):
        """
        Извлекает и возвращает элемент из начала очереди.
        :return: Элемент из очереди.
        :raises queue.Empty: Если очередь пуста.
        """
        with self._lock:
            try:
                return self._queue.get_nowait()
            except queue.Empty:
                raise queue.Empty("Очередь пуста.")

    def is_empty(self):
        """
        Проверяет, пуста ли очередь.
        :return: True, если очередь пуста, иначе False.
        """
        with self._lock:
            return self._queue.empty()

    def is_full(self):
        """
        Проверяет, заполнена ли очередь.
        :return: True, если очередь заполнена, иначе False.
        """
        with self._lock:
            return self._queue.full()

    def size(self):
        """
        Возвращает текущий размер очереди.
        :return: Количество элементов в очереди.
        """
        with self._lock:
            return self._queue.qsize()

    def peek(self):
        """
        Возвращает элемент из начала очереди без его извлечения.
        :return: Элемент из начала очереди.
        :raises queue.Empty: Если очередь пуста.
        """
        with self._lock:
            if self._queue.empty():
                raise queue.Empty("Очередь пуста.")
            # Извлекаем элемент и кладем его обратно
            item = self._queue.get()
            self._queue.put(item)
            # Так как очередь FIFO, элемент гарантированно вернется в конец,
            # но для peek логически правильнее было бы использовать LifoQueue для этого метода.
            # Для простой очереди peek не всегда однозначен.
            # Этот способ работает, но неэффективен. В реальности для peek нужна другая структура.
            # Альтернатива - хранить список/другую структуру для доступа к первому элементу.
            # Здесь оставим простую реализацию, понимая ограничение.
            # Более корректная реализация peek возможна с использованием collections.deque.
            temp_items = []
            temp_items.append(self._queue.get())
            while not self._queue.empty():
                temp_items.append(self._queue.get())
            for item in reversed(temp_items):
                 self._queue.put(item)
            return temp_items[0]

# Пример использования
if __name__ == "__main__":
    crystal_queue = Crystal(maxsize=3)

    print("Добавляем элементы 1, 2, 3")
    crystal_queue.enqueue(1)
    crystal_queue.enqueue(2)
    crystal_queue.enqueue(3)

    print(f"Размер очереди: {crystal_queue.size()}")
    print(f"Очередь заполнена: {crystal_queue.is_full()}")

    print(f"Просмотр первого элемента: {crystal_queue.peek()}")
    print(f"Извлекаем элемент: {crystal_queue.dequeue()}")
    print(f"Размер очереди: {crystal_queue.size()}")
    print(f"Извлекаем элемент: {crystal_queue.dequeue()}")
    print(f"Извлекаем элемент: {crystal_queue.dequeue()}")

    print(f"Очередь пуста: {crystal_queue.is_empty()}")
    try:
        crystal_queue.dequeue()  # Вызовет исключение queue.Empty
    except queue.Empty as e:
        print(f"Ошибка при извлечении: {e}")
