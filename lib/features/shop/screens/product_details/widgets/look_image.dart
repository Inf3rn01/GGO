// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ggo/common/widgets/app_bar/auth_appbar.dart';
// import 'package:ggo/features/shop/screens/product_details/widgets/product_slider.dart';
// import 'package:ggo/utils/helpers/helper_functions.dart';
// import '../../../../../utils/constants/colors.dart';
// import '../../../../../utils/constants/images_strings.dart';

// class LookMoreImage extends StatelessWidget {
//   final int index; // Добавляем параметр индекса

//   const LookMoreImage({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final darkTheme = GHelperFunctions.isDarkMode(context);
//     return Scaffold(
//       appBar: AuthAppBar(
//         showBackArrow: false,
//         actions: [
//           IconButton(
//             onPressed: () => Get.back(),
//             icon: const Icon(CupertinoIcons.clear),
//             color: darkTheme ? GColors.white : GColors.dark,
//           )
//         ],
//       ),
//       body: GProductSlider(
//         banners: [GImages.productImageAssault1, GImages.productImage2],
//         applyImageRadius: true,
//         initialPage: index, // Устанавливаем начальную страницу слайдера
//       ),
//     );
//   }
// }