import 'package:ggo/common/styles/spacing_styles.dart';
import 'package:ggo/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ggo/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: GSpacingStyle.paddingWithAppBarHeigth,
          child: Column(
            children: [
              
              /// Logo, Title & Sub-Title
              GLoginHeader(),

              /// Form
              GLoginForm(),

            ],
          ),
        ),
      ),
    );
  }
}
