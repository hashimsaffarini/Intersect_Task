import 'package:flutter/material.dart';
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
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xff373E52).withOpacity(0.4),
              AppColors.primaryColor,
            ],
          ),
        ),
        child: const Column(
          children: [
            CustomHomeAppBar(),
          ],
        ),
      ),
    );
  }
}
