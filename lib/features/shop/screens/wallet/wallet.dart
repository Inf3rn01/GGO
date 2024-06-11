import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:get/get.dart';
import '../../../../common/widgets/app_bar/auth_appbar.dart';
import '../../../../utils/constants/colors.dart';
import '../../../personalization/controlers/user_controller.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final TextEditingController _amountController = TextEditingController();
  final UserController _userController = UserController.instance;

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: GColors.dark.withOpacity(0.7),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Введите данные карты',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const SizedBox(height: 20),
          stripe.CardField(
            onCardChanged: (card) {
              _userController.setCardFieldInputDetails(card!);
            },
          ),
          const SizedBox(height: 14),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
              labelText: 'Сумма пополнения',
              border: const OutlineInputBorder(),
              filled: true,
              fillColor: GColors.dark.withOpacity(0.5),
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {
              final amount = double.tryParse(_amountController.text);
              if (amount != null && _userController.cardFieldInputDetails != null && _userController.cardFieldInputDetails!.complete) {
                _userController.topUpBalance(amount).then((_) {
                  _amountController.clear();
                  Navigator.pop(context);
                }).catchError((error) {
                  Get.snackbar('Ошибка', 'Ошибка пополнения: $error');
                });
              } else {
                Get.snackbar('Ошибка', 'Введите корректную сумму и данные карты.');
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 119.0, vertical: 15.0),
              backgroundColor: Colors.green,
              foregroundColor: Colors.white.withOpacity(0.9),
              side: BorderSide(color: Colors.green.withOpacity(0.9)),
            ),
            child: const Text('Пополнить'),
          ),
          const SizedBox(height: 15),
        ],
      ),
    ),
  ).then((_) {
    _amountController.clear();
  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AuthAppBar(title: Text('Кошелёк'), showBackArrow: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          if (_userController.profileLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                  side: BorderSide(color: Colors.amber.withOpacity(0.55), width: 0.55),
                ),
                color: GColors.dark.withOpacity(0.75),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Баланс',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '\$${double.tryParse(_userController.user.value.balance)?.toStringAsFixed(2) ?? "0.00"}',
                        style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => _showBottomSheet(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.withOpacity(0.8),
                          foregroundColor: GColors.dark,
                          side: BorderSide(color: Colors.black.withOpacity(0.5)),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Text('Пополнить баланс'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }
}