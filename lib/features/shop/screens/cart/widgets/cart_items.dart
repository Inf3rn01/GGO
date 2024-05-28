import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images_strings.dart';
import '../../checkout/checkout.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  void updateCartItemCount(int newCount) {
    final navigationController = Get.find<NavigationController>();
    navigationController.updateCartItemCount(newCount);
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    int currentCartItemCount = 2;

    void increaseCartItemCount() {
      currentCartItemCount++; // Увеличиваем количество товаров
      updateCartItemCount(currentCartItemCount); // Обновляем количество в NavigationController
    }

    // Пример: функция для уменьшения количества товаров в корзине
    void decreaseCartItemCount() {
      if (currentCartItemCount > 0) {
        currentCartItemCount--;
        updateCartItemCount(currentCartItemCount); // Обновляем количество в NavigationController
      }
    }

    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemCount: 5,
      itemBuilder: (_, index) => GRoundedContainer(
        backgroundColor: darkTheme ? GColors.dark : GColors.grey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  /// Image
                  const GRoundedImage(
                    isNetworkImage: true,
                    imageUrl: GImages.productImageAssault1,
                    width: 100,
                    height: 100,
                    backgroundColor: Colors.transparent,
                  ),

                  const SizedBox(width: 10),

                  /// Title, Price, Checkout item
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          const Flexible(
                            child: Row(
                              children: [
                                ProductPriceText(price: '1000', size: 19.5),
                              ],
                            ),
                          ),
                        const Flexible(child: ProductTitleText(title: 'АK-47', maxLines: 1, smallSize: true)),
                        if (showAddRemoveButtons)
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GRoundedContainer(
                                  height: 38,
                                  width: 103,
                                  backgroundColor: darkTheme ? GColors.darkerGrey.withOpacity(0.35) : GColors.grey,
                                  child: Row(
                                    children: [
                                      IconButton(onPressed: decreaseCartItemCount, icon: const Icon(EvaIcons.minus, color: Colors.blue, size: 20)),
                                      const Text('1', style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w500)),
                                      IconButton(onPressed: increaseCartItemCount, icon: Icon(EvaIcons.plus, color: Colors.red.withOpacity(0.9), size: 19)),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 10),

                                ElevatedButton(
                                  onPressed: () => Get.to(() => const CheckoutScreen()),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: darkTheme ? GColors.darkerGrey.withOpacity(0.35) : GColors.grey,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 39),
                                  ),
                                  child: const Row(
                                    children: [
                                      Text('Buy', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}