import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SearchContainer extends StatefulWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    required this.onChanged,
  });

  final String text;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final ValueChanged<String> onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _SearchContainerState createState() => _SearchContainerState();
}

class _SearchContainerState extends State<SearchContainer> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onChanged(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 27.0, right: 27.0, top: 34, bottom: 28),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Iconsax.search_normal_1_outline, size: 18, color: GColors.darkGrey),
                  border: InputBorder.none,
                  hintText: widget.text,
                  hintStyle: const TextStyle(fontSize: 15, color: GColors.darkGrey, fontWeight: FontWeight.w500),
                  filled: true,
                  fillColor: darkTheme ? GColors.dark : GColors.light,
                  contentPadding: const EdgeInsets.symmetric(vertical: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}