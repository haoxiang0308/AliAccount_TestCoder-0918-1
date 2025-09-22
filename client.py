#!/usr/bin/env python3

import sys
sys.path.append('gen-py')

from order_service import OrderService
from order_service.ttypes import *

from thrift import Thrift
from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def main():
    # Создаем соединение с сервером
    transport = TSocket.TSocket('127.0.0.1', 9090)
    transport = TTransport.TBufferedTransport(transport)
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    client = OrderService.Client(protocol)
    
    # Открываем соединение
    transport.open()
    
    try:
        # Создаем новый заказ
        print("Creating a new order...")
        create_request = CreateOrderRequest(
            customer_name="John Doe",
            items="Pizza, Coke",
            total_amount=15.50
        )
        order = client.createOrder(create_request)
        print(f"Created order: {order}")
        
        # Получаем заказ по ID
        print("\nGetting the order...")
        get_request = GetOrderRequest(order_id=order.id)
        retrieved_order = client.getOrder(get_request)
        print(f"Retrieved order: {retrieved_order}")
        
        # Обновляем статус заказа
        print("\nUpdating order status...")
        success = client.updateOrderStatus(order.id, "CONFIRMED")
        if success:
            print("Order status updated successfully")
            
            # Проверяем обновленный заказ
            updated_order = client.getOrder(get_request)
            print(f"Updated order: {updated_order}")
        
        # Пытаемся получить несуществующий заказ (для проверки исключения)
        print("\nTrying to get a non-existent order...")
        try:
            get_request = GetOrderRequest(order_id=999)
            client.getOrder(get_request)
        except OrderNotFoundException as e:
            print(f"Caught exception as expected: {e.message}")
            
    except Thrift.TException as tx:
        print(f"Thrift exception: {tx.message}")
        
    finally:
        # Закрываем соединение
        transport.close()

if __name__ == '__main__':
    main()