import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/networking/api_constants.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';

class FeaturedSeriesPageViewItem extends StatelessWidget {
  const FeaturedSeriesPageViewItem({
    super.key,
    this.movie,
  });
  final Results? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(27.r),
        child: movie != null
            ? CachedNetworkImage(
                imageUrl: ApiConstants.imageBaseUrl +
                    ApiConstants.posterSize +
                    movie!.posterPath!,
                fit: BoxFit.cover,
                width: 200.w,
                height: 302.h,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(27.r),
                child: Container(
                  color: Colors.grey,
                  width: 200.w,
                  height: 302.h,
                ),
              ),
      ),
    );
  }
}
