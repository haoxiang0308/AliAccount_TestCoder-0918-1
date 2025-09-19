#!/usr/bin/env python3

import sys
import uuid
from datetime import datetime
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

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

# Хранилище заказов в памяти
orders_storage = {}

class OrderServiceHandler:
    def __init__(self):
        pass

    def createOrder(self, order):
        print(f"Creating order for customer {order.customerId}")
        
        # Генерируем уникальный ID для заказа
        order_id = str(uuid.uuid4())
        order.orderId = order_id
        order.timestamp = int(datetime.now().timestamp())
        order.status = "CREATED"
        
        # Вычисляем общую сумму заказа
        total = sum(item.quantity * item.price for item in order.items)
        order.totalAmount = total
        
        # Сохраняем заказ
        orders_storage[order_id] = order
        
        return OperationResult(True, "Order created successfully", order_id)

    def getOrder(self, orderId):
        print(f"Getting order {orderId}")
        
        if orderId not in orders_storage:
            raise OrderException("Order not found", "ORDER_NOT_FOUND")
            
        return orders_storage[orderId]

    def updateOrderStatus(self, orderId, newStatus):
        print(f"Updating order {orderId} status to {newStatus}")
        
        if orderId not in orders_storage:
            raise OrderException("Order not found", "ORDER_NOT_FOUND")
            
        orders_storage[orderId].status = newStatus
        return OperationResult(True, f"Order status updated to {newStatus}", orderId)

    def cancelOrder(self, orderId):
        print(f"Canceling order {orderId}")
        
        if orderId not in orders_storage:
            raise OrderException("Order not found", "ORDER_NOT_FOUND")
            
        orders_storage[orderId].status = "CANCELLED"
        return OperationResult(True, "Order cancelled successfully", orderId)

    def getOrdersByCustomer(self, customerId):
        print(f"Getting orders for customer {customerId}")
        
        customer_orders = [
            order for order in orders_storage.values() 
            if order.customerId == customerId
        ]
        
        return customer_orders

if __name__ == '__main__':
    handler = OrderServiceHandler()
    # processor = OrderService.Processor(handler)
    # transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    # tfactory = TTransport.TBufferedTransportFactory()
    # pfactory = TBinaryProtocol.TBinaryProtocolFactory()
    
    # server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    
    print('Starting the order service server...')
    # server.serve()
    print('Server is running (simulation mode)')
    
    # Создадим тестовый заказ для демонстрации
    item1 = OrderItem("1", "Product 1", 2, 10.0)
    item2 = OrderItem("2", "Product 2", 1, 25.0)
    test_order = Order(None, "customer123", [item1, item2], 0, None, None)
    
    result = handler.createOrder(test_order)
    print(f"Test order created: {result.orderId}")
    
    retrieved_order = handler.getOrder(result.orderId)
    print(f"Retrieved order total: {retrieved_order.totalAmount}")
    
    handler.updateOrderStatus(result.orderId, "SHIPPED")
    updated_order = handler.getOrder(result.orderId)
    print(f"Updated order status: {updated_order.status}")
    
    customer_orders = handler.getOrdersByCustomer("customer123")
    print(f"Customer has {len(customer_orders)} orders")