namespace java com.example.order
namespace py order_service

// Статус заказа
enum OrderStatus {
  CREATED = 1,
  PAID = 2,
  SHIPPED = 3,
  DELIVERED = 4,
  CANCELLED = 5
}

// Элемент заказа
struct OrderItem {
  1: string productId,
  2: string productName,
  3: i32 quantity,
  4: double price
}

// Заказ
struct Order {
  1: string orderId,
  2: string customerId,
  3: list<OrderItem> items,
  4: double totalAmount,
  5: OrderStatus status,
  6: i64 createdTime,
  7: i64 updatedTime
}

// Запрос на создание заказа
struct CreateOrderRequest {
  1: string customerId,
  2: list<OrderItem> items
}

// Ответ на создание заказа
struct CreateOrderResponse {
  1: bool success,
  2: string message,
  3: Order order
}

// Запрос на получение заказа
struct GetOrderRequest {
  1: string orderId
}

// Исключение для заказа
exception OrderNotFoundException {
  1: string orderId,
  2: string message
}

// Сервис обработки заказов
service OrderService {
  // Создать новый заказ
  CreateOrderResponse createOrder(1: CreateOrderRequest request),
  
  // Получить информацию о заказе
  Order getOrder(1: GetOrderRequest request) throws (1: OrderNotFoundException notFound),
  
  // Обновить статус заказа
  bool updateOrderStatus(1: string orderId, 2: OrderStatus newStatus) throws (1: OrderNotFoundException notFound),
  
  // Отменить заказ
  bool cancelOrder(1: string orderId) throws (1: OrderNotFoundException notFound)
}