namespace py order_service
namespace java com.example.order

// Типы ошибок
exception InvalidRequestException {
  1: string message
}

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
  1: i64 id,
  2: string customer_name,
  3: string customer_email,
  4: list<OrderItem> items,
  5: double total_amount,
  6: OrderStatus status = OrderStatus.PENDING,
  7: i64 timestamp
}

// Структура товара в заказе
struct OrderItem {
  1: i64 product_id,
  2: string product_name,
  3: i32 quantity,
  4: double price
}

// Сервис обработки заказов
service OrderService {
  // Создать новый заказ
  i64 createOrder(1: Order order) throws (1: InvalidRequestException ire),

  // Получить информацию о заказе по ID
  Order getOrder(1: i64 orderId) throws (1: InvalidRequestException ire),

  // Обновить статус заказа
  void updateOrderStatus(1: i64 orderId, 2: OrderStatus newStatus) throws (1: InvalidRequestException ire),

  // Получить список всех заказов
  list<Order> getAllOrders()
}