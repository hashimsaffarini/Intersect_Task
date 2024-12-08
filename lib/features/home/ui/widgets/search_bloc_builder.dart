import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/networking/api_constants.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/core/theming/app_styles.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';
import 'package:intersect_task/features/home/logic/home_state.dart';
import 'package:intersect_task/features/home/ui/featured_details_screen.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          final filteredMovies = cubit.filteredMovies ?? [];
          if (filteredMovies.isEmpty) {
            return Center(
              child: Text(
                'No movies found',
                style: AppStyles.medium14.copyWith(
                  color: Colors.white70,
                ),
              ),
            );
          }
          return ListView.builder(
            itemCount: filteredMovies.length,
            itemBuilder: (context, index) {
              final movie = filteredMovies[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    FeaturedDetailsScreen.routeName,
                    arguments: movie,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CachedNetworkImage(
                      imageUrl: ApiConstants.imageBaseUrl +
                          ApiConstants.posterSize +
                          (movie.posterPath ?? ''),
                      width: 50.w,
                      height: 75.h,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error, color: Colors.red),
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    title: Text(
                      movie.title ?? 'Unknown Title',
                      style: AppStyles.medium14.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
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
