import 'package:get/get.dart';
import 'package:ggo/features/shop/models/product_models.dart';
import '../../../utils/popups/loaders.dart';
import '../models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityCart = 1.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  int get totalQuantity => cartItems.fold(0, (sum, item) => sum + item.quantity);

  void addToCart(ProductModel product) {
    if (productQuantityCart.value < 1) {
      Loaders.customToast(message: 'Select the quantity of the product');
      return;
    }

    final existingItem = cartItems.firstWhereOrNull((item) => item.productId == product.id);

    if (existingItem != null) {
      existingItem.quantity += productQuantityCart.value;
    } else {
      final cartItem = convertToCartItem(product, productQuantityCart.value);
      cartItems.add(cartItem);
    }

    cartItems.refresh();
    calculateTotalCartPrice();
    noOfCartItems.value = cartItems.length;
    productQuantityCart.value = 1;
    Loaders.customToast(message: 'Product added to cart');
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: product.price,
      image: product.images?.isNotEmpty == true ? product.images!.first : null,
      quantity: quantity,
    );
  }

  void removeFromCart(CartItemModel cartItem) {
    cartItems.remove(cartItem);
    calculateTotalCartPrice();
    noOfCartItems.value = cartItems.length;
    cartItems.refresh();
  }

  void increaseQuantity(CartItemModel cartItem) {
    cartItem.quantity++;
    cartItems.refresh();
    calculateTotalCartPrice();
  }

  void decreaseQuantity(CartItemModel cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      cartItems.remove(cartItem);
    }
    cartItems.refresh();
    calculateTotalCartPrice();
    noOfCartItems.value = cartItems.length;
  }

  void calculateTotalCartPrice() {
    totalCartPrice.value = cartItems.fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }
}
