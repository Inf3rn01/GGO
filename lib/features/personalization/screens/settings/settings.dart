import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggo/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:ggo/features/personalization/screens/address/address.dart';
import 'package:ggo/features/personalization/screens/profile/profile.dart';
import 'package:ggo/features/shop/screens/order/order.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../common/widgets/app_bar/market_appbar.dart';
import '../tip_how_get_a_gun/get_gun.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// AppBar
            const MarketAppBar(),

            ///Body
            Padding(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  GSettingsMenuTile(icon: Iconsax.profile_circle_bold, title: 'Профиль', subTitle: 'Редактирование настроек учетной записи', onTap: () => Get.to(() => const ProfileScreen())),
                  GSettingsMenuTile(icon: Iconsax.location_bold, title: 'Мои адреса', subTitle: 'Выберите удобное для вас место, где вы хотите забрать свой заказ', onTap: () => Get.to(() => const UserAddressScreen())),
                  GSettingsMenuTile(icon: Iconsax.bag_happy_bold, title: 'Мои заказы', subTitle: 'Незавершенные и выполненные заказы', onTap: () => Get.to(() => const OrderScreen())),
                  GSettingsMenuTile(icon: Iconsax.wallet_1_bold, title: 'Кошелёк', subTitle: 'Вывод средств на зарегистрированный банковский счет', onTap: () {}),
                  //GSettingsMenuTile(icon: Iconsax.notification_bold, title: 'Notifications', subTitle: 'Set any kind of notification messages', onTap: () {}),
                  GSettingsMenuTile(icon: FontAwesome.gun_solid, size: 25, title: 'Как я могу получить оружие?', subTitle: 'Прочитайте это, чтобы узнать, как вы можете получить оружие', onTap: () => Get.to(()=> const GetGunScreen())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}