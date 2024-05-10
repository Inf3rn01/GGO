import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../../common/widgets/app_bar/market_appbar.dart';

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
                  GSettingsMenuTile(icon: Iconsax.profile_circle_bold, title: 'My details', subTitle: 'Editing account settings', onTap: () {}),
                  GSettingsMenuTile(icon: Iconsax.bag_happy_bold, title: 'My Orders', subTitle: 'In-progress and complited orders', onTap: () {}),
                  GSettingsMenuTile(icon: Iconsax.dollar_circle_bold, title: 'Balance', subTitle: 'Withdraw balance to registered bank account', onTap: () {}),
                  GSettingsMenuTile(icon: Iconsax.location_bold, title: 'Geolocation', subTitle: 'Set recomendation based on location', trailing: Switch(value: true, onChanged: (value) {})),
                  GSettingsMenuTile(icon: Iconsax.notification_bold, title: 'Notifications', subTitle: 'Set any kind of notification messages', onTap: () {}),
                  GSettingsMenuTile(icon: FontAwesome.gun_solid, title: 'How can I get a gun?', subTitle: 'Read this to find out how you can get a gun', onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}