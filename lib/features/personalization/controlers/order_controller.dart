import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ggo/data/repositories/order/order_repository.dart';

import '../../shop/models/order_model.dart';


class OrderController extends GetxController {
  static OrderController get instance => Get.find();
  
  final OrderRepository _orderRepository = OrderRepository();

  Future<void> createOrder(OrderModel order) async {
    await _orderRepository.saveOrder(order);
  }

  Stream<QuerySnapshot> getOrders() {
    return _orderRepository.getOrders();
  }
}