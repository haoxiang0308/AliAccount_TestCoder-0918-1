namespace py order_service

// Определение структуры заказа
struct Order {
    1: i64 id,
    2: string customer_name,
    3: list<string> items,
    4: double total_amount,
    5: string status
}

// Определение исключения
exception OrderNotFound {
    1: string message
}

// Определение сервиса
service OrderService {
    // Создать новый заказ
    Order create_order(1: Order order),

    // Получить заказ по ID
    Order get_order(1: i64 id) throws (1: OrderNotFound e),

    // Обновить статус заказа
    void update_status(1: i64 id, 2: string new_status) throws (1: OrderNotFound e),

    // Получить все заказы
    list<Order> get_all_orders()
}