import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/core/networking/api_constants.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeaturedSeriesPageViewItem extends StatefulWidget {
  const FeaturedSeriesPageViewItem({
    super.key,
    this.movie,
  });
  final Results? movie;

  @override
  State<FeaturedSeriesPageViewItem> createState() =>
      _FeaturedSeriesPageViewItemState();
}

class _FeaturedSeriesPageViewItemState
    extends State<FeaturedSeriesPageViewItem> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    if (widget.movie != null) {
      final prefs = await SharedPreferences.getInstance();
      setState(() {
        isFavorite = prefs.getBool(widget.movie!.id.toString()) ?? false;
      });
    }
  }

  Future<void> _toggleFavorite() async {
    if (widget.movie != null) {
      final prefs = await SharedPreferences.getInstance();
      final newStatus = !isFavorite;
      await prefs.setBool(widget.movie!.id.toString(), newStatus);
      setState(() {
        isFavorite = newStatus;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;
    return Stack(
      children: [
        Container(
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
                        movie.posterPath!,
                    fit: BoxFit.cover,
                    width: 200.w,
                    height: 302.h,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => const Center(
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
        ),
        Positioned(
          top: 8,
          right: 30,
          child: GestureDetector(
            onTap: _toggleFavorite,
            child: Icon(
              isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              color: isFavorite ? Colors.red : Colors.white,
              size: 30.r,
            ),
          ),
        ),
      ],
    );
  }
}
