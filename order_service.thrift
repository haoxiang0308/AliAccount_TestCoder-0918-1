namespace py gen_py
namespace java gen_java

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customer_name,
  3: list<OrderItem> items,
  4: double total_amount,
  5: string status
}

// Определение структуры элемента заказа
struct OrderItem {
  1: i64 product_id,
  2: string product_name,
  3: i32 quantity,
  4: double price
}

// Определение исключения
exception OrderNotFoundException {
  1: string message
}

// Сервис обработки заказов
service OrderService {
  // Создать новый заказ
  Order createOrder(1: Order order),

  // Получить заказ по ID
  Order getOrder(1: i64 id) throws (1: OrderNotFoundException e),

  // Обновить статус заказа
  void updateOrderStatus(1: i64 id, 2: string new_status) throws (1: OrderNotFoundException e),

  // Получить все заказы
  list<Order> getAllOrders()
}