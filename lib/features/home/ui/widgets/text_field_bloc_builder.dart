import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intersect_task/core/theming/app_images.dart';
import 'package:intersect_task/core/theming/app_styles.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';
import 'package:intersect_task/features/home/logic/home_state.dart';
import 'package:intersect_task/features/home/ui/widgets/search_bloc_builder.dart';

class TextFieldBlocBuilder extends StatelessWidget {
  const TextFieldBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return TextField(
          controller: cubit.searchController,
          autofocus: true,
          cursorColor: Colors.white,
          onChanged: cubit.filterMovies,
          style: AppStyles.medium14.copyWith(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xff767680).withOpacity(0.12),
            hintText: 'Search for movies',
            hintStyle: AppStyles.medium14.copyWith(
              color: const Color(0xffA0A0A0),
            ),
            prefixIcon: SvgPicture.asset(
              Assets.imagesSearch,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                cubit.searchController.clear();
                cubit.clearSearch();
              },
              icon: Icon(
                Icons.clear,
                color: Colors.white,
                size: 24.w,
              ),
            ),
            border: buildOutLineInputBorder(),
            focusedBorder: buildOutLineInputBorder(),
            enabledBorder: buildOutLineInputBorder(),
          ),
        );
      },
    );
  }
}
