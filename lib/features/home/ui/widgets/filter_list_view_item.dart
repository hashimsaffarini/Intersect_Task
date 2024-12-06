import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intersect_task/core/helpers/spaces.dart';
import 'package:intersect_task/core/theming/app_styles.dart';
import 'package:intersect_task/features/home/data/models/filter_item_model.dart';

class FilterListViewItem extends StatelessWidget {
  const FilterListViewItem({super.key, required this.item});
  final FilterItemModel item;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 52.h,
          width: 52.w,
          decoration: BoxDecoration(
            color: const Color(0xff51535D),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: SvgPicture.asset(
              item.image,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        verticalSpace(4),
        Text(
          item.title,
          style: AppStyles.medium12.copyWith(
            color: const Color(0xffA0A0A0),
          ),
        ),
      ],
    );
  }
}
