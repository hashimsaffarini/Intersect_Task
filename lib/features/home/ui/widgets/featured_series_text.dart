import 'package:flutter/material.dart';
import 'package:intersect_task/core/theming/app_styles.dart';

class FeaturedSeriesText extends StatelessWidget {
  const FeaturedSeriesText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Featured ',
          style: AppStyles.medium24.copyWith(
            color: Colors.white,
          ),
        ),
        Text(
          'Series',
          style: AppStyles.light24.copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
