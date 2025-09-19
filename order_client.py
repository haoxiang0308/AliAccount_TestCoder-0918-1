#!/usr/bin/env python3

import sys
import uuid
from datetime import datetime

# Имитация сгенерированного кода из thrift-файла
class OrderItem:
    def __init__(self, productId=None, productName=None, quantity=None, price=None):
        self.productId = productId
        self.productName = productName
        self.quantity = quantity
        self.price = price

class Order:
    def __init__(self, orderId=None, customerId=None, items=None, totalAmount=None, status=None, timestamp=None):
        self.orderId = orderId
        self.customerId = customerId
        self.items = items if items is not None else []
        self.totalAmount = totalAmount
        self.status = status
        self.timestamp = timestamp

class OperationResult:
    def __init__(self, success=None, message=None, orderId=None):
        self.success = success
        self.message = message
        self.orderId = orderId

class OrderException(Exception):
    def __init__(self, message, errorCode):
        self.message = message
        self.errorCode = errorCode
        super().__init__(self.message)

# Имитация клиента, который будет взаимодействовать с сервером
class OrderServiceClient:
    def __init__(self, handler):
        self.handler = handler

    def createOrder(self, order):
        return self.handler.createOrder(order)

    def getOrder(self, orderId):
        return self.handler.getOrder(orderId)

    def updateOrderStatus(self, orderId, newStatus):
        return self.handler.updateOrderStatus(orderId, newStatus)

    def cancelOrder(self, orderId):
        return self.handler.cancelOrder(orderId)

    def getOrdersByCustomer(self, customerId):
        return self.handler.getOrdersByCustomer(customerId)

# Имитация обработчика сервера (в реальном приложении это будет удаленный вызов)
class MockOrderServiceHandler:
    def __init__(self):
        self.orders_storage = {}

    def createOrder(self, order):
        print(f"[Client] Creating order for customer {order.customerId}")
        
        # Генерируем уникальный ID для заказа
        order_id = str(uuid.uuid4())
        order.orderId = order_id
        order.timestamp = int(datetime.now().timestamp())
        order.status = "CREATED"
        
        # Вычисляем общую сумму заказа
        total = sum(item.quantity * item.price for item in order.items)
        order.totalAmount = total
        
        # Сохраняем заказ
        self.orders_storage[order_id] = order
        
        return OperationResult(True, "Order created successfully", order_id)

    def getOrder(self, orderId):
        print(f"[Client] Getting order {orderId}")
        
        if orderId not in self.orders_storage:
            raise OrderException("Order not found", "ORDER_NOT_FOUND")
            
        return self.orders_storage[orderId]

    def updateOrderStatus(self, orderId, newStatus):
        print(f"[Client] Updating order {orderId} status to {newStatus}")
        
        if orderId not in self.orders_storage:
            raise OrderException("Order not found", "ORDER_NOT_FOUND")
            
        self.orders_storage[orderId].status = newStatus
        return OperationResult(True, f"Order status updated to {newStatus}", orderId)

    def cancelOrder(self, orderId):
        print(f"[Client] Canceling order {orderId}")
        
        if orderId not in self.orders_storage:
            raise OrderException("Order not found", "ORDER_NOT_FOUND")
            
        self.orders_storage[orderId].status = "CANCELLED"
        return OperationResult(True, "Order cancelled successfully", orderId)

    def getOrdersByCustomer(self, customerId):
        print(f"[Client] Getting orders for customer {customerId}")
        
        customer_orders = [
            order for order in self.orders_storage.values() 
            if order.customerId == customerId
        ]
        
        return customer_orders

def main():
    # Создаем клиент и обработчик
    handler = MockOrderServiceHandler()
    client = OrderServiceClient(handler)
    
    print("=== Order Service Client Demo ===")
    
    # Создаем заказ
    item1 = OrderItem("P001", "Laptop", 1, 1200.0)
    item2 = OrderItem("P002", "Mouse", 2, 25.0)
    order = Order(None, "customer_001", [item1, item2], 0, None, None)
    
    try:
        # Создаем заказ
        result = client.createOrder(order)
        print(f"Order created successfully. Order ID: {result.orderId}")
        
        # Получаем заказ
        retrieved_order = client.getOrder(result.orderId)
        print(f"Order total amount: ${retrieved_order.totalAmount}")
        print(f"Order status: {retrieved_order.status}")
        
        # Обновляем статус заказа
        update_result = client.updateOrderStatus(result.orderId, "PROCESSING")
        print(f"Status update result: {update_result.message}")
        
        # Получаем обновленный заказ
        updated_order = client.getOrder(result.orderId)
        print(f"Updated order status: {updated_order.status}")
        
        # Получаем все заказы клиента
        customer_orders = client.getOrdersByCustomer("customer_001")
        print(f"Customer has {len(customer_orders)} order(s)")
        
        # Отменяем заказ
        cancel_result = client.cancelOrder(result.orderId)
        print(f"Cancel result: {cancel_result.message}")
        
        # Проверяем финальный статус
        final_order = client.getOrder(result.orderId)
        print(f"Final order status: {final_order.status}")
        
    except OrderException as e:
        print(f"Order service error: {e.message} (Error code: {e.errorCode})")
    except Exception as e:
        print(f"Unexpected error: {str(e)}")

if __name__ == '__main__':
    main()