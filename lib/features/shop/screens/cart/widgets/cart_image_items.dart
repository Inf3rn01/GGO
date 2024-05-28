import 'package:flutter/material.dart';

import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../data/cart_data.dart';

class CartImageItems extends StatelessWidget {
  const CartImageItems({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return GRoundedImage(
      isNetworkImage: true,
      imageUrl: cartItem.imageUrl,
      width: 10,
      height: 50,
      backgroundColor: Colors.transparent,
    );
  }
}