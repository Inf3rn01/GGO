import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
import 'widgets/orders_list.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AuthAppBar(showBackArrow: true, title: Text('My orders')),
      body: Padding(
        padding: EdgeInsets.all(16),
        /// Orders
      child: OrderListItems(),
      ),
    );
  }
}