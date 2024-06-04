
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:ggo/features/authentication/screens/login/login.dart';
import 'package:ggo/features/authentication/screens/login/password_configuration/forget_password.dart';
import 'package:ggo/features/authentication/screens/sign_up/signup.dart';
import 'package:ggo/features/authentication/screens/sign_up/widgets/verify_email.dart';
import 'package:ggo/features/personalization/screens/address/address.dart';
import 'package:ggo/features/personalization/screens/profile/profile.dart';
import 'package:ggo/features/personalization/screens/settings/settings.dart';
import 'package:ggo/features/shop/screens/cart/cart.dart';
import 'package:ggo/features/shop/screens/checkout/checkout.dart';
import 'package:ggo/features/shop/screens/home/home.dart';
import 'package:ggo/features/shop/screens/order/order.dart';
import 'package:ggo/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ggo/routes/routes.dart';

class AppRoutes{
  static final pages = [
    GetPage(name: GRoutes.home, page: () => const HomeScreen()),
    GetPage(name: GRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: GRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: GRoutes.order, page: () => const OrderScreen()),
    GetPage(name: GRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: GRoutes.cart, page: () => const CartScreen()),
    GetPage(name: GRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: GRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: GRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: GRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: GRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: GRoutes.forgetPassword, page: () => ForgetPasswordScreen()),
  ];
}