namespace py orderservice

struct Order {
    1: i32 id,
    2: string customer_name,
    3: list<string> items,
    4: double total_amount,
    5: string status = "PENDING"
}

exception OrderNotFoundException {
    1: string message
}

service OrderService {
    void create_order(1: Order order),
    Order get_order(1: i32 order_id) throws (1: OrderNotFoundException e),
    void update_order_status(1: i32 order_id, 2: string new_status) throws (1: OrderNotFoundException e),
    list<Order> get_all_orders()
}