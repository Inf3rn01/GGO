import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar/market_appbar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MarketAppBar()
    );
  }
}









/// TODO: Реализовать счётчик товаров
//controller.updateCartItemCount(newCartItemCount);