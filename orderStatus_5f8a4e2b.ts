// Enum to represent the status of an order
export enum OrderStatus {
  PENDING = 'PENDING',
  CONFIRMED = 'CONFIRMED',
  SHIPPED = 'SHIPPED',
  DELIVERED = 'DELIVERED',
  CANCELLED = 'CANCELLED'
}

// Example usage
const myOrderStatus: OrderStatus = OrderStatus.PENDING;
console.log(`Current order status is: ${myOrderStatus}`);