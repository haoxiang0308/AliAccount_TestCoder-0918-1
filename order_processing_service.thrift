// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customer_name,
  3: list<string> items,
  4: double total_amount,
  5: string status
}

// Определение исключения для ошибок
exception OrderException {
  1: string message
}

// Определение сервиса для обработки заказов
service OrderService {
  // Создание нового заказа
  i64 createOrder(1: string customer_name, 2: list<string> items, 3: double total_amount) throws (1: OrderException ex),
  
  // Получение информации о заказе по ID
  Order getOrder(1: i64 order_id) throws (1: OrderException ex),
  
  // Обновление статуса заказа
  void updateOrderStatus(1: i64 order_id, 2: string status) throws (1: OrderException ex),
  
  // Получение всех заказов клиента
  list<Order> getOrdersByCustomer(1: string customer_name) throws (1: OrderException ex),
  
  // Удаление заказа
  void deleteOrder(1: i64 order_id) throws (1: OrderException ex)
}