namespace py orders
namespace java com.example.orders

// Типы ошибок
exception InvalidOrderException {
  1: string message
}

exception OrderNotFoundException {
  1: i64 orderId
}

// Определение структуры заказа
struct Order {
  1: required i64 id,
  2: required string description,
  3: required double totalAmount,
  4: required string currency = "USD",
  5: required string status = "PENDING", // PENDING, CONFIRMED, SHIPPED, DELIVERED, CANCELLED
  6: optional string customerEmail
}

// Интерфейс сервиса
service OrderService {

  // Создать новый заказ
  Order createOrder(1: Order order) throws (1: InvalidOrderException e),

  // Получить заказ по ID
  Order getOrder(1: i64 orderId) throws (1: OrderNotFoundException e),

  // Обновить статус заказа
  bool updateOrderStatus(1: i64 orderId, 2: string newStatus) throws (1: OrderNotFoundException e, 2: InvalidOrderException e),

  // Удалить заказ
  bool deleteOrder(1: i64 orderId) throws (1: OrderNotFoundException e)
}