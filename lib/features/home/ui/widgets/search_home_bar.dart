import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intersect_task/core/theming/app_images.dart';
import 'package:intersect_task/core/theming/app_styles.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';
import 'package:intersect_task/features/home/ui/search_screen.dart';

class SearchHomeBar extends StatelessWidget {
  const SearchHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: context.read<HomeCubit>(),
              child: const SearchScreen(),
            ),
          ),
        );
      },
      child: Container(
        height: 50.h,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: const Color(0xff767680).withOpacity(0.12),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              Assets.imagesSearch,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 12),
            Text(
              'Search',
              style: AppStyles.medium14.copyWith(
                color: const Color(0xffA0A0A0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
