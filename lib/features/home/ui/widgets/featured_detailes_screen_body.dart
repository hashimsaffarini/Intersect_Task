import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intersect_task/core/networking/api_constants.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/core/theming/app_images.dart';
import 'package:intersect_task/core/theming/app_styles.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';
import 'package:intersect_task/features/home/ui/widgets/movie_metadate_item.dart';

class FeaturedDetailsScreenBody extends StatelessWidget {
  const FeaturedDetailsScreenBody({super.key, required this.movie});
  final Results movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.45.h,
          width: double.infinity,
          child: CachedNetworkImage(
            imageUrl: ApiConstants.imageBaseUrl +
                ApiConstants.posterSize +
                movie.posterPath!,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primaryColor.withOpacity(0),
                  AppColors.primaryColor.withOpacity(1),
                  AppColors.primaryColor.withOpacity(1),
                  AppColors.primaryColor.withOpacity(1.0),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 300.h,
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            Assets.imagesPlay,
            height: 60.h,
            width: 60.w,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.43.h,
          ),
          child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    child: Text(
                      movie.originalTitle ?? 'No Title',
                      style: AppStyles.semiBold24.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        MovieMetadataItem(
                          icon: Icons.calendar_today_outlined,
                          label: "Release Date",
                          value: movie.releaseDate ?? "Unknown",
                        ),
                        const SizedBox(width: 20),
                        MovieMetadataItem(
                          icon: Icons.language,
                          label: "Language",
                          value: movie.originalLanguage?.toUpperCase() ?? "N/A",
                        ),
                        const SizedBox(width: 20),
                        MovieMetadataItem(
                          icon: Icons.trending_up,
                          label: "Popularity",
                          value: movie.popularity?.toStringAsFixed(0) ?? '0',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Overview",
                          style: AppStyles.semiBold18
                              .copyWith(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          movie.overview ?? "No overview available.",
                          style: AppStyles.regular16.copyWith(
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 20.w),
                            const SizedBox(width: 5),
                            Text(
                              "${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'} / 10",
                              style: AppStyles.regular16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            Icon(Icons.how_to_vote,
                                color: Colors.white70, size: 20.w),
                            const SizedBox(width: 5),
                            Text(
                              "${movie.voteCount ?? 0} Votes",
                              style: AppStyles.regular16
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (movie.genreIds != null && movie.genreIds!.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Genres",
                            style: AppStyles.semiBold18
                                .copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: movie.genreIds!
                                .map((id) => Chip(
                                      label: Text(
                                        "Genre $id",
                                        style: AppStyles.regular14.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: AppColors.primaryColor,
                                    ))
                                .toList(),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
