import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/helpers/spaces.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/features/home/ui/widgets/build_search_app_bar.dart';
import 'package:intersect_task/features/home/ui/widgets/search_bloc_builder.dart';
import 'package:intersect_task/features/home/ui/widgets/text_field_bloc_builder.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildSearchAppBar(context),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primaryColor,
              AppColors.primaryColor,
              Color(0xff373E52),
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: SafeArea(
            child: Column(
              children: [
                const TextFieldBlocBuilder(),
                verticalSpace(16),
                const SearchBlocBuilder(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
