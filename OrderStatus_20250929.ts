/**
 * 定义订单状态的TypeScript枚举。
 */
export enum OrderStatus {
  PENDING = 'PENDING',
  CONFIRMED = 'CONFIRMED',
  SHIPPED = 'SHIPPED',
  DELIVERED = 'DELIVERED',
  CANCELLED = 'CANCELLED'
}

// 示例：如何使用该枚举
function logOrderStatus(status: OrderStatus): void {
  console.log(`当前订单状态: ${status}`);
}

// 使用示例
logOrderStatus(OrderStatus.PENDING); // 输出: 当前订单状态: PENDING
logOrderStatus(OrderStatus.SHIPPED); // 输出: 当前订单状态: SHIPPED