#!/usr/bin/env python3

import sys
import glob
sys.path.append('gen-py')

from order_service import OrderService
from order_service.ttypes import *

from thrift.transport import TSocket
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol
from thrift.server import TServer

import logging
logging.basicConfig(level=logging.INFO)

class OrderServiceHandler:
    def __init__(self):
        self.orders = {}
        self.next_order_id = 1

    def getOrder(self, request):
        logging.info(f"Getting order with ID: {request.order_id}")
        if request.order_id not in self.orders:
            raise OrderNotFoundException(f"Order with ID {request.order_id} not found")
        return self.orders[request.order_id]

    def createOrder(self, request):
        logging.info(f"Creating order for customer: {request.customer_name}")
        order = Order(
            id=self.next_order_id,
            customer_name=request.customer_name,
            items=request.items,
            total_amount=request.total_amount,
            status="CREATED"
        )
        self.orders[self.next_order_id] = order
        self.next_order_id += 1
        return order

    def updateOrderStatus(self, order_id, status):
        logging.info(f"Updating order {order_id} status to: {status}")
        if order_id not in self.orders:
            raise OrderNotFoundException(f"Order with ID {order_id} not found")
        self.orders[order_id].status = status
        return True

if __name__ == '__main__':
    handler = OrderServiceHandler()
    processor = OrderService.Processor(handler)
    transport = TSocket.TServerSocket(host='127.0.0.1', port=9090)
    tfactory = TTransport.TBufferedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()
    
    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    
    print('Starting the order service server...')
    server.serve()