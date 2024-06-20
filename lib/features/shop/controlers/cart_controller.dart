import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:ggo/features/personalization/controlers/user_controller.dart';
import 'package:ggo/features/shop/controlers/product_controller.dart';
import 'package:ggo/features/shop/models/cart_model.dart';
import 'package:ggo/utils/popups/loaders.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityCart = 1.obs;
  RxList<CartModel> cartItems = <CartModel>[].obs;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final productController = Get.put(ProductController());

  @override
  void onInit() {
    super.onInit();
    final userId = Get.put(UserController()).user.value.id;
    if (userId.isNotEmpty) {
      fetchCartItems(userId);
    }
  }

  int get totalQuantity => cartItems.fold(0, (sum, item) => 
      sum + item.quantity!.fold(0, (sum, qty) => sum + qty));

  Future<void> addToCart(String userId, String productId, int quantity) async {
    if (quantity < 1) {
      Loaders.customToast(message: 'Выберите количество товаров');
      return;
    }

    final docRef = _firestore.collection('Cart').doc(userId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final cart = CartModel.fromJson(docSnapshot.data()!);
      final index = cart.productId!.indexOf(productId);

      if (index >= 0) {
        cart.quantity![index] += quantity;
      } else {
        cart.productId!.add(productId);
        cart.quantity!.add(quantity);
      }

      await docRef.set(cart.toJson());
    } else {
      final newCart = CartModel(
        userId: userId,
        productId: [productId],
        quantity: [quantity],
      );
      await docRef.set(newCart.toJson());
    }

    Loaders.customToast(message: 'Товар добавлен в корзину');
    await fetchCartItems(userId);
    productQuantityCart.value = 1;
  }

  Future<void> removeFromCart(String userId, String productId) async {
    final docRef = _firestore.collection('Cart').doc(userId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final cart = CartModel.fromJson(docSnapshot.data()!);
      final index = cart.productId!.indexOf(productId);

      if (index >= 0) {
        cart.productId!.removeAt(index);
        cart.quantity!.removeAt(index);
        await docRef.set(cart.toJson());
      }

      await fetchCartItems(userId);
    }
  }

  Future<void> clearCart(String userId) async {
    final docRef = _firestore.collection('Cart').doc(userId);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final cart = CartModel.fromJson(docSnapshot.data()!);

      cart.productId!.clear();
      cart.quantity!.clear();

      await docRef.set(cart.toJson());
  }

  cartItems.clear();
  noOfCartItems.value = 0;
  totalCartPrice.value = 0.0;
}

  Future<void> fetchCartItems(String userId) async {
  final docRef = _firestore.collection('Cart').doc(userId);
  final docSnapshot = await docRef.get();

  if (docSnapshot.exists) {
    final cart = CartModel.fromJson(docSnapshot.data()!);
    
    // Проверяем, что массивы не только существуют, но и содержат элементы
    if (cart.productId != null && cart.productId!.isNotEmpty) {
      cartItems.value = [cart];
      noOfCartItems.value = cart.productId!.length;
      calculateTotalCartPrice();
    } else {
      cartItems.clear();
      noOfCartItems.value = 0;
      totalCartPrice.value = 0.0;
    }
  } else {
    cartItems.clear();
    noOfCartItems.value = 0;
    totalCartPrice.value = 0.0;
  }
}

  void calculateTotalCartPrice() {
    totalCartPrice.value = cartItems.fold(0.0, (sum, cart) {
      double cartTotal = 0.0;
      for (int i = 0; i < cart.productId!.length; i++) {
        final product = productController.getProductById(cart.productId![i]);
        cartTotal += product.price * cart.quantity![i];
      }
      return sum + cartTotal;
    });
  }

  Future<void> increaseQuantity(String userId, String productId) async {
    final cartItem = cartItems.first;
    final index = cartItem.productId!.indexOf(productId);
    if (index >= 0) {
      cartItem.quantity![index]++;
      await updateCartInDB(userId, cartItem);
      cartItems.refresh();
      calculateTotalCartPrice();
    }
  }

  Future<void> decreaseQuantity(String userId, String productId) async {
    final cartItem = cartItems.first;
    final index = cartItem.productId!.indexOf(productId);
    if (index >= 0) {
      if (cartItem.quantity![index] > 1) {
        cartItem.quantity![index]--;
      } else {
        cartItem.productId!.removeAt(index);
        cartItem.quantity!.removeAt(index);
      }
      await updateCartInDB(userId, cartItem);
      cartItems.refresh();
      calculateTotalCartPrice();

      if (cartItem.productId!.isEmpty) {
        await clearCart(userId);
      }
    }
  }

  Future<void> updateCartInDB(String userId, CartModel cart) async {
    await _firestore.collection('Cart').doc(userId).set(cart.toJson());
  }
}