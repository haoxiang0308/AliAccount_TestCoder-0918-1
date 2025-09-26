namespace py order_service
namespace java order_service

// Типы
struct Order {
  1: i64 id,
  2: string customer_name,
  3: list<OrderItem> items,
  4: string status,
  5: i64 total_amount
}

struct OrderItem {
  1: i64 product_id,
  2: string product_name,
  3: i32 quantity,
  4: i64 price
}

struct PlaceOrderRequest {
  1: string customer_name,
  2: list<OrderItem> items
}

struct PlaceOrderResponse {
  1: i64 order_id,
  2: string status
}

// Исключения
exception InvalidOrderException {
  1: string message
}

exception OrderNotFoundException {
  1: i64 order_id
}

// Сервис
service OrderService {
  PlaceOrderResponse place_order(1: PlaceOrderRequest request) throws (1: InvalidOrderException e),
  Order get_order(1: i64 order_id) throws (1: OrderNotFoundException e),
  void update_order_status(1: i64 order_id, 2: string new_status) throws (1: OrderNotFoundException e)
}