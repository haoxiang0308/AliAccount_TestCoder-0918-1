/**
 * 订单状态枚举
 */
export enum OrderStatus {
  /**
   * 待支付
   */
  PENDING_PAYMENT = 'PENDING_PAYMENT',
  
  /**
   * 已支付
   */
  PAID = 'PAID',
  
  /**
   * 已取消
   */
  CANCELLED = 'CANCELLED',
  
  /**
   * 已发货
   */
  SHIPPED = 'SHIPPED',
  
  /**
   * 已完成
   */
  COMPLETED = 'COMPLETED',
  
  /**
   * 退款中
   */
  REFUNDING = 'REFUNDING',
  
  /**
   * 已退款
   */
  REFUNDED = 'REFUNDED'
}

// 示例用法
console.log('订单状态枚举值:');
console.log('待支付:', OrderStatus.PENDING_PAYMENT);
console.log('已支付:', OrderStatus.PAID);
console.log('已取消:', OrderStatus.CANCELLED);
console.log('已发货:', OrderStatus.SHIPPED);
console.log('已完成:', OrderStatus.COMPLETED);
console.log('退款中:', OrderStatus.REFUNDING);
console.log('已退款:', OrderStatus.REFUNDED);