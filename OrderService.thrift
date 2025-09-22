// OrderService.thrift

// Структура данных для заказа
struct Order {
  1: i32 id,
  2: string customerName,
  3: string customerEmail,
  4: list<string> items,
  5: double totalAmount,
  6: string status,
  7: i64 timestamp
}

// Структура для результата операции
struct OperationResult {
  1: bool success,
  2: string message,
  3: optional Order order
}

// Исключение для обработки ошибок
exception OrderException {
  1: i32 errorCode,
  2: string message
}

// Сервис для обработки заказов
service OrderService {
  // Создание нового заказа
  OperationResult createOrder(1: Order order) throws (1: OrderException ex),
  
  // Получение заказа по ID
  Order getOrder(1: i32 orderId) throws (1: OrderException ex),
  
  // Обновление статуса заказа
  OperationResult updateOrderStatus(1: i32 orderId, 2: string newStatus) throws (1: OrderException ex),
  
  // Получение всех заказов клиента
  list<Order> getOrdersByCustomer(1: string customerEmail) throws (1: OrderException ex),
  
  // Отмена заказа
  OperationResult cancelOrder(1: i32 orderId) throws (1: OrderException ex)
}