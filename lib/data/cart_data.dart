

import 'package:ggo/utils/constants/images_strings.dart';

class CartItem {
  final String id;
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
  });
}

List<CartItem> cartItems = [
  CartItem(
    id: '1',
    imageUrl: GImages.productImageAssault1,
    title: 'Product 1',
    price: 100.0,
    quantity: 1,
  ),
  CartItem(
    id: '1',
    imageUrl: GImages.productImageAssault1,
    title: 'Product 1',
    price: 100.0,
    quantity: 1,
  ),
];