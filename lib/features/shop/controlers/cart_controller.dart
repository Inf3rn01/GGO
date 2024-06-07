import 'package:get/get.dart';
import 'package:ggo/features/shop/models/product_models.dart';
import '../../../utils/popups/loaders.dart';
import '../models/cart_item_model.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  void addToCart(ProductModel product) {
    if (productQuantityCart.value < 1) {
      Loaders.customToast(message: 'Выберите количество товара');
      return;
    }

    final cartItem = convertToCartItem(product, productQuantityCart.value);
    final existingItem = cartItems.firstWhereOrNull((item) => item.productId == cartItem.productId);

    if (existingItem != null) {
      existingItem.quantity += cartItem.quantity;
    } else {
      cartItems.add(cartItem);
    }

    calculateTotalCartPrice();
    noOfCartItems.value = cartItems.length;
    productQuantityCart.value = 0;
    Loaders.customToast(message: 'Продукт добавлен в корзину');
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
  }

  void increaseQuantity(CartItemModel cartItem) {
    cartItem.quantity++;
    calculateTotalCartPrice();
  }

  void decreaseQuantity(CartItemModel cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
    } else {
      cartItems.remove(cartItem);
    }
    calculateTotalCartPrice();
    noOfCartItems.value = cartItems.length;
  }

  void calculateTotalCartPrice() {
    totalCartPrice.value = cartItems.fold(0.0, (sum, item) => sum + item.price * item.quantity);
  }
}