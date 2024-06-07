import 'package:flutter/material.dart';

import 'projects_indicator_and_rating.dart';

class OverallProductRaiting extends StatelessWidget {
  const OverallProductRaiting({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 3, child: Padding(
          padding: const EdgeInsets.only(left: 26),
          child: Text('4', style: Theme.of(context).textTheme.displayMedium),
        )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              RatingProgressIndicator(text: '5', value: 0),
              RatingProgressIndicator(text: '4', value: 1),
              RatingProgressIndicator(text: '3', value: 0),
              RatingProgressIndicator(text: '2', value: 0),
              RatingProgressIndicator(text: '1', value: 0),
            ],
          )
        
        )
      ],
    );
  }
}