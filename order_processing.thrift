namespace py processor
namespace java processor

// Определение структуры заказа
struct Order {
  1: i64 id,
  2: string customer_name,
  3: string customer_email,
  4: list<OrderItem> items,
  5: string status = "pending", // pending, confirmed, shipped, delivered, cancelled
  6: double total_amount,
}

// Определение структуры товара в заказе
struct OrderItem {
  1: i64 product_id,
  2: string product_name,
  3: i32 quantity,
  4: double price,
}

// Определение исключения для заказа
exception OrderNotFound {
  1: string message,
}

exception InvalidOrder {
  1: string message,
}

// Определение сервиса обработки заказов
service OrderProcessor {
  // Создать новый заказ
  Order create_order(1: Order order) throws (1: InvalidOrder invalid),

  // Получить заказ по ID
  Order get_order(1: i64 order_id) throws (1: OrderNotFound not_found),

  // Обновить статус заказа
  Order update_order_status(1: i64 order_id, 2: string new_status) throws (1: OrderNotFound not_found, 2: InvalidOrder invalid),

  // Подсчитать общую сумму заказа
  double calculate_total(1: Order order),
}