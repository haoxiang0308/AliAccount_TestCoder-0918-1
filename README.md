# Thrift Order Service

Этот проект демонстрирует реализацию сервиса обработки заказов с использованием Apache Thrift.

## Файлы проекта

1. `order_service.thrift` - Определение сервиса Thrift
2. `order_server.py` - Реализация сервера (имитация)
3. `order_client.py` - Клиент для тестирования сервиса

## Описание сервиса

Сервис предоставляет следующие функции:
- Создание нового заказа
- Получение информации о заказе по ID
- Обновление статуса заказа
- Отмена заказа
- Получение всех заказов клиента

## Структуры данных

### OrderItem
- `string productId` - ID продукта
- `string productName` - Название продукта
- `i32 quantity` - Количество
- `double price` - Цена

### Order
- `string orderId` - ID заказа
- `string customerId` - ID клиента
- `list<OrderItem> items` - Список товаров в заказе
- `double totalAmount` - Общая сумма заказа
- `string status` - Статус заказа
- `i64 timestamp` - Временная метка создания заказа

## Установка и запуск

1. Установите зависимости:
   ```
   pip install thrift
   ```

2. Запустите клиент для демонстрации работы сервиса:
   ```
   python order_client.py
   ```

## Использование Thrift компилятора

Для генерации кода на других языках программирования используйте thrift-компилятор:

```
thrift -r --gen py order_service.thrift
thrift -r --gen java order_service.thrift
```

## Лицензия

Этот проект лицензирован по лицензии MIT.