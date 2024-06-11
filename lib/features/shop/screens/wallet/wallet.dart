import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:get/get.dart';
import '../../../../common/widgets/app_bar/auth_appbar.dart';
import '../../../personalization/controlers/user_controller.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});

  final TextEditingController _amountController = TextEditingController();
  final UserController _userController = UserController.instance;

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
            children: [
              Card(
                child: ListTile(
                  title: const Text('Баланс'),
                  subtitle: Text(
                    _userController.user.value.balance.isNotEmpty &&
                            double.tryParse(_userController.user.value.balance) != null
                        ? '\$${double.parse(_userController.user.value.balance).toStringAsFixed(2)}'
                        : 'Invalid balance',
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Сумма пополнения',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: stripe.CardField(
                    onCardChanged: (card) {
                      _userController.setCardFieldInputDetails(card!);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final amount = double.tryParse(_amountController.text);
                  if (amount != null) {
                    _userController.topUpBalance(amount);
                  } else {
                    Get.snackbar('Ошибка', 'Введите корректную сумму.');
                  }
                },
                child: const Text('Пополнить баланс'),
              ),
            ],
          );
        }),
      ),
    );
  }
}