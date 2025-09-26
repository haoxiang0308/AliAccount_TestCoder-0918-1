// order_service_tVtFkn.thrift
namespace py orderservice
namespace java com.example.orderservice

// Статусы заказа
enum OrderStatus {
  PENDING = 1,
  CONFIRMED = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5
}

// Структура заказа
struct Order {
  1: required i64 id,
  2: required string customerId,
  3: required list<OrderItem> items,
  4: required double totalAmount,
  5: required OrderStatus status,
  6: optional string address,
  7: optional string notes
}

// Структура элемента заказа
struct OrderItem {
  1: required string productId,
  2: required i32 quantity,
  3: required double price
}

// Исключение для ошибок
exception OrderNotFound {
  1: string message
}

exception InvalidOrder {
  1: string message
}

// Сервис обработки заказов
service OrderService {
  // Создать новый заказ
  Order createOrder(1: Order order) throws (1: InvalidOrder error),

  // Получить заказ по ID
  Order getOrder(1: i64 orderId) throws (1: OrderNotFound error),

  // Обновить статус заказа
  void updateOrderStatus(1: i64 orderId, 2: OrderStatus newStatus) throws (1: OrderNotFound error),

  // Получить все заказы клиента
  list<Order> getOrdersByCustomer(1: string customerId)
}