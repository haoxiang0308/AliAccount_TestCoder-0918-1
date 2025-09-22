namespace py order_service

// Структура заказа
struct Order {
    1: i32 id,
    2: string customer_name,
    3: string items,
    4: double total_amount,
    5: string status
}

// Структура для запроса заказа
struct GetOrderRequest {
    1: i32 order_id
}

// Структура для создания заказа
struct CreateOrderRequest {
    1: string customer_name,
    2: string items,
    3: double total_amount
}

// Исключение для случая, когда заказ не найден
exception OrderNotFoundException {
    1: string message
}

// Сервис для обработки заказов
service OrderService {
    // Получить заказ по ID
    Order getOrder(1: GetOrderRequest request) throws (1: OrderNotFoundException ex),
    
    // Создать новый заказ
    Order createOrder(1: CreateOrderRequest request),
    
    // Обновить статус заказа
    bool updateOrderStatus(1: i32 order_id, 2: string status) throws (1: OrderNotFoundException ex)
}