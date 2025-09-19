// Определение сервиса для обработки заказов

namespace java com.example.orderservice
namespace py orderservice

// Структура элемента заказа
struct OrderItem {
  1: string productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Структура заказа
struct Order {
  1: string orderId,
  2: string customerId,
  3: list<OrderItem> items,
  4: double totalAmount,
  5: string status,
  6: i64 timestamp
}

// Структура результата операции
struct OperationResult {
  1: bool success,
  2: string message,
  3: string orderId
}

// Исключение для обработки ошибок
exception OrderException {
  1: string message,
  2: string errorCode
}

// Сервис для обработки заказов
service OrderService {
  // Создание нового заказа
  OperationResult createOrder(1: Order order) throws (1: OrderException ex),
  
  // Получение информации о заказе по ID
  Order getOrder(1: string orderId) throws (1: OrderException ex),
  
  // Обновление статуса заказа
  OperationResult updateOrderStatus(1: string orderId, 2: string newStatus) throws (1: OrderException ex),
  
  // Отмена заказа
  OperationResult cancelOrder(1: string orderId) throws (1: OrderException ex),
  
  // Получение всех заказов клиента
  list<Order> getOrdersByCustomer(1: string customerId) throws (1: OrderException ex)
}