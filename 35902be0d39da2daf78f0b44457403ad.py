def calculate_average(numbers):
    """
    Вычисляет среднее значение списка чисел.

    :param numbers: Список чисел.
    :return: Среднее значение (float) или None, если список пуст.
    """
    if not numbers:
        return None
    return sum(numbers) / len(numbers)

# Пример использования
if __name__ == "__main__":
    sample_list = [1, 2, 3, 4, 5]
    avg = calculate_average(sample_list)
    print(f"Среднее значение {sample_list} равно {avg}")