import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intersect_task/core/helpers/spaces.dart';
import 'package:intersect_task/core/theming/app_images.dart';
import 'package:intersect_task/core/theming/app_styles.dart';

class SearchHomeBar extends StatelessWidget {
  const SearchHomeBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xff767680).withOpacity(0.12),
        hintText: 'Search',
        hintStyle: AppStyles.medium14.copyWith(
          color: const Color(0xffA0A0A0),
        ),
        prefixIcon: SvgPicture.asset(
          Assets.imagesSearch,
          fit: BoxFit.scaleDown,
        ),
        suffixIcon: SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 1.w,
                height: 24.h,
                color: Colors.white.withOpacity(0.3),
              ),
              horizontalSpace(12),
              SvgPicture.asset(
                Assets.imagesMicrophone,
                fit: BoxFit.scaleDown,
              ),
              horizontalSpace(12),
            ],
          ),
        ),
        border: buildOutLineInputBorder(),
        focusedBorder: buildOutLineInputBorder(),
        enabledBorder: buildOutLineInputBorder(),
      ),
    );
  }
}

OutlineInputBorder buildOutLineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: Colors.white.withOpacity(0.1),
    ),
  );
}
