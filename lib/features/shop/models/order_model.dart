import 'package:ggo/features/shop/controlers/cart_controller.dart';

import '../../personalization/controlers/user_controller.dart';

class OrderModel {
  String? userId;
  List<String>? productId;
  List<int>? quantity;
  String? totalPrice;

  OrderModel({
    this.userId,
    this.productId,
    this.quantity,
    this.totalPrice,
  });

  // Метод для конвертации из JSON
  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      userId: json['userId'] as String?,
      productId: List<String>.from(json['productId'] ?? []),
      quantity: List<int>.from(json['quantity'] ?? []),
      totalPrice: json['totalPrice'] as String?,
    );
  }

  // Метод для конвертации в JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productId': productId,
      'quantity': quantity,
      'totalPrice': totalPrice,
    };
  }

  // Статический метод для создания OrderModel из userController и cartController
  static OrderModel fromControllers(UserController userController, CartController cartController) {
    List<String> flattenedProductIds = [];
    List<int> flattenedQuantities = [];

    for (var cartItem in cartController.cartItems) {
      if (cartItem.productId != null && cartItem.quantity != null) {
        flattenedProductIds.addAll(cartItem.productId!);
        flattenedQuantities.addAll(cartItem.quantity!);
      }
    }

    return OrderModel(
      userId: userController.user.value.id,
      productId: flattenedProductIds,
      quantity: flattenedQuantities,
      totalPrice: cartController.totalCartPrice.value.toStringAsFixed(2),
    );
  }
}