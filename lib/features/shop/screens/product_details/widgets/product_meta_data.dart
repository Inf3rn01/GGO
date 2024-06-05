import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ggo/common/widgets/texts/product_price_text.dart';
import 'package:ggo/common/widgets/texts/product_title_text.dart';
import 'package:ggo/features/shop/controlers/product_controller.dart';

import '../../../models/product_models.dart';


class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// Price
        Align(
          alignment: Alignment.centerLeft,
          child: ProductPriceText(price: controller.getProductPrice(product), size: 21.5),
        ),
        
        /// Title
        Align(
          alignment: Alignment.centerLeft,
          child: ProductTitleText(title: product.title, smallSize: false, maxLines: 2),
        ),
      ],
    );
  }
}