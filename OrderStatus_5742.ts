/**
 * 枚举表示订单的不同状态
 */
export enum OrderStatus {
  /**
   * 订单已创建，等待付款
   */
  PENDING = 'PENDING',

  /**
   * 订单已付款，等待发货
   */
  PAID = 'PAID',

  /**
   * 订单已发货，正在配送中
   */
  SHIPPED = 'SHIPPED',

  /**
   * 订单已取消
   */
  CANCELLED = 'CANCELLED',

  /**
   * 订单已完成
   */
  COMPLETED = 'COMPLETED'
}