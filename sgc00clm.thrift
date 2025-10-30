namespace java com.example.orderservice
namespace py order_service
namespace cpp order_service

// Order status enumeration
enum OrderStatus {
    PENDING = 0,
    CONFIRMED = 1,
    PROCESSING = 2,
    SHIPPED = 3,
    DELIVERED = 4,
    CANCELLED = 5
}

// Order item structure
struct OrderItem {
    1: required i32 productId,
    2: required string productName,
    3: required i32 quantity,
    4: required double price
}

// Order structure
struct Order {
    1: required i64 orderId,
    2: required i64 userId,
    3: required list<OrderItem> items,
    4: required double totalAmount,
    5: required string currency,
    6: required OrderStatus status,
    7: required string createdAt,
    8: optional string updatedAt
}

// Request structures
struct CreateOrderRequest {
    1: required i64 userId,
    2: required list<OrderItem> items,
    3: required string currency
}

struct GetOrderRequest {
    1: required i64 orderId
}

struct UpdateOrderStatusRequest {
    1: required i64 orderId,
    2: required OrderStatus status
}

// Response structures
struct CreateOrderResponse {
    1: required bool success,
    2: optional Order order,
    3: optional string errorMessage
}

struct GetOrderResponse {
    1: required bool success,
    2: optional Order order,
    3: optional string errorMessage
}

struct UpdateOrderStatusResponse {
    1: required bool success,
    2: optional string errorMessage
}

struct ListOrdersResponse {
    1: required bool success,
    2: optional list<Order> orders,
    3: optional string errorMessage
}

// Exception for order-related errors
exception OrderException {
    1: string message,
    2: i32 errorCode
}

// Main OrderService interface
service OrderService {
    // Create a new order
    CreateOrderResponse createOrder(1: CreateOrderRequest request) throws (1: OrderException ex),
    
    // Get an order by ID
    GetOrderResponse getOrder(1: GetOrderRequest request) throws (1: OrderException ex),
    
    // Update order status
    UpdateOrderStatusResponse updateOrderStatus(1: UpdateOrderStatusRequest request) throws (1: OrderException ex),
    
    // List orders for a user
    ListOrdersResponse listOrders(1: i64 userId) throws (1: OrderException ex),
    
    // Cancel an order
    UpdateOrderStatusResponse cancelOrder(1: i64 orderId) throws (1: OrderException ex)
}