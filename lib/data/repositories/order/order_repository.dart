import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../features/shop/models/order_model.dart';


class OrderRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveOrder(OrderModel order) async {
    await _db.collection('Order').add(order.toJson());
  }

  Stream<QuerySnapshot> getOrders() {
    return _db.collection('Order').snapshots();
  }
}