import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ggo/bindings/general_bindings.dart';
import 'package:ggo/routes/app_routes.dart';
import '/utils/theme/theme.dart';
import 'utils/constants/colors.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      
      home: const Scaffold(backgroundColor: GColors.dark, body: Center(child: CircularProgressIndicator(color: GColors.primary),),),
    );
  }
}