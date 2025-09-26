namespace py order_service
namespace java com.example.orderservice

// Определение типа данных для элемента заказа
struct OrderItem {
    1: i32 product_id,
    2: i32 quantity,
    3: string product_name,
    4: double price
}

// Определение типа данных для заказа
struct Order {
    1: i64 order_id,
    2: list<OrderItem> items,
    3: double total_amount,
    4: string customer_name,
    5: string customer_address,
    6: string status
}

// Определение исключения для ошибок
exception OrderNotFound {
    1: string message
}

exception InvalidOrder {
    1: string message
}

// Определение сервиса
service OrderService {
    // Создать новый заказ
    Order createOrder(1: list<OrderItem> items, 2: string customer_name, 3: string customer_address) throws (1: InvalidOrder error),

    // Получить заказ по ID
    Order getOrder(1: i64 order_id) throws (1: OrderNotFound error),

    // Обновить статус заказа
    void updateOrderStatus(1: i64 order_id, 2: string status) throws (1: OrderNotFound error),

    // Получить все заказы
    list<Order> getAllOrders()
}