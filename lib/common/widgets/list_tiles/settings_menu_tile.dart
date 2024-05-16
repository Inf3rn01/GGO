import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/constants/colors.dart';

class GSettingsMenuTile extends StatelessWidget {
  const GSettingsMenuTile({
    super.key,
    required this.icon,
    this.size = 28,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
    });

  final IconData icon;
  final double size;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: size, color: GColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}