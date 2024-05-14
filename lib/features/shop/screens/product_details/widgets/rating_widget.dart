import 'package:flutter/material.dart';
import 'package:ggo/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ggo/utils/constants/colors.dart';
import 'package:icons_plus/icons_plus.dart';

class Rating extends StatelessWidget {
  const Rating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row( // Используем Row в качестве корневого виджета
      children: [
        GestureDetector(
          onTap: () {},
          child: GRoundedContainer(
            width: 58,
            backgroundColor: Colors.black.withOpacity(0.2),
            showBorder: true,
            borderColor: GColors.borderPrimary.withOpacity(0.1),
            radius: 12,
            child: const Padding(
              padding: EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание по левому краю
                children: [
                  Row(
                    children: [
                      Icon(
                        HeroIcons.star,
                        color: Colors.amber,
                        size: 21,
                      ),
                      SizedBox(width: 1),
                      Text('4.7 ', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 4),
                      Text('(199)', style: TextStyle(fontSize: 14.5)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        // Добавьте другие виджеты, если нужно
      ],
    );
  }
}