import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/helpers/spaces.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/core/theming/app_styles.dart';
import 'package:intersect_task/features/home/ui/widgets/custom_home_app_bar.dart';
import 'package:intersect_task/features/home/ui/widgets/filters_list_view.dart';
import 'package:intersect_task/features/home/ui/widgets/search_home_bar.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primaryColor,
            Color(0xff373E52),
          ],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(8),
              const CustomHomeAppBar(),
              verticalSpace(36),
              const SearchHomeBar(),
              verticalSpace(36),
              Text(
                'Filters',
                style: AppStyles.medium18.copyWith(
                  color: Colors.white,
                ),
              ),
              verticalSpace(16),
              const FiltersListView(),
              verticalSpace(36),
            ],
          ),
        ),
      ),
    );
  }
}
