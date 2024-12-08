import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intersect_task/core/helpers/spaces.dart';
import 'package:intersect_task/core/networking/api_constants.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/core/theming/app_images.dart';
import 'package:intersect_task/core/theming/app_styles.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';
import 'package:intersect_task/features/home/logic/home_state.dart';
import 'package:intersect_task/features/home/ui/featured_details_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 24.w,
          ),
          onPressed: () {
            context.read<HomeCubit>().fetchMovies();
            Navigator.pop(context);
          },
        ),
      ),
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
                BlocBuilder<HomeCubit, HomeState>(
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
                ),
                verticalSpace(16),
                Expanded(
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
                                      const Icon(Icons.error,
                                          color: Colors.red),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: Colors.white.withOpacity(0.1),
      ),
    );
  }
}
