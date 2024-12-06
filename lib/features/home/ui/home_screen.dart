import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/helpers/spaces.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/features/home/ui/widgets/custom_home_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff373E52),
              AppColors.primaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: SafeArea(
            child: Column(
              children: [
                verticalSpace(8),
                const CustomHomeAppBar(),
                verticalSpace(36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
