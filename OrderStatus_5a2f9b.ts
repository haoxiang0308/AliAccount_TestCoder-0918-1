/**
 * 枚举：订单状态
 */
export enum OrderStatus {
  /**
   * 待付款
   */
  PENDING_PAYMENT = 'pending_payment',

  /**
   * 待发货
   */
  PENDING_SHIPMENT = 'pending_shipment',

  /**
   * 已发货
   */
  SHIPPED = 'shipped',

  /**
   * 已完成
   */
  COMPLETED = 'completed',

  /**
   * 已取消
   */
  CANCELLED = 'cancelled',
}
