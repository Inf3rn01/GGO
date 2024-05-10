import 'package:ggo/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:ggo/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:ggo/utils/helpers/helper_functions.dart';

class GPrimaryHeaderContainer extends StatelessWidget {
  const GPrimaryHeaderContainer({
    super.key,
    required this.child
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final darkTheme = GHelperFunctions.isDarkMode(context);
    return GCurvedEdgeWidget(
      child: Container(
        color: darkTheme ? GColors.primary : GColors.softGrey,
        child: Stack(
          children: [
            /// Background Custom Shapes
            Positioned(top: -150, right: -250,child: GCircularContainer(backgroundColor: darkTheme ? GColors.black.withOpacity(0.115) : GColors.black.withOpacity(0.1))),
            Positioned(top: 100, right: -300,child: GCircularContainer(backgroundColor: darkTheme ? GColors.black.withOpacity(0.115) : GColors.black.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}