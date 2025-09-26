// order_service_random.thrift

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customer_name,
  3: list<string> items,
  4: double total_amount,
  5: string status
}

// Определение исключения для ошибки валидации
exception ValidationException {
  1: string reason
}

// Определение сервиса
service OrderService {
  // Метод для создания нового заказа
  i64 createOrder(1: Order order) throws (1: ValidationException validation_exception),

  // Метод для получения заказа по ID
  Order getOrder(1: i64 id) throws (1: ValidationException validation_exception),

  // Метод для обновления статуса заказа
  void updateOrderStatus(1: i64 id, 2: string new_status) throws (1: ValidationException validation_exception),

  // Метод для получения списка всех заказов
  list<Order> getAllOrders()
}
