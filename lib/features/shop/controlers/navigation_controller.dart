import 'package:get/get.dart';
import 'package:ggo/features/personalization/screens/settings/settings.dart';
import 'package:ggo/features/shop/controlers/cart_controller.dart';
import 'package:ggo/features/shop/screens/cart/cart.dart';
import 'package:ggo/features/shop/screens/home/home.dart';

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  final Rx<int> selectedIndex = 0.obs;
  final Rx<int> cartItemCount = 0.obs;
  final screens = [const HomeScreen(), const CartScreen(), const SettingsScreen()];

  @override
  void onInit() {
    super.onInit();
    final cartController = Get.put(CartController());
    cartItemCount.value = cartController.totalQuantity;
    ever(cartController.cartItems, (_) {
      cartItemCount.value = cartController.totalQuantity;
    });
  }

  void updateCartItemCount(int count) {
    cartItemCount.value = count;
  }
}