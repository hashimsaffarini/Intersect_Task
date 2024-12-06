import 'package:flutter/material.dart';
import 'package:intersect_task/core/helpers/spaces.dart';
import 'package:intersect_task/core/theming/app_images.dart';
import 'package:intersect_task/core/theming/app_styles.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Hello ',
                  style: AppStyles.semiBold24.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Daizy',
                  style: AppStyles.light24.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            verticalSpace(4),
            Text(
              'Check for latest addition.',
              style: AppStyles.medium14.copyWith(
                color: const Color(0xffA0A0A0),
              ),
            )
          ],
        ),
        const Spacer(),
        Image.asset(Assets.imagesProfileImage)
      ],
    );
  }
}
