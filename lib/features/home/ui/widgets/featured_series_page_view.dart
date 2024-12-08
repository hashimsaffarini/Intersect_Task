import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';
import 'package:intersect_task/features/home/ui/featured_details_screen.dart';
import 'package:intersect_task/features/home/ui/widgets/featured_series_page_view_item.dart';

class FeaturedSeriesPageView extends StatelessWidget {
  const FeaturedSeriesPageView({super.key, this.movies});
  final MoviesResponseModel? movies;

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 0.6);
    return SizedBox(
      height: 302.h,
      child: PageView.builder(
        clipBehavior: Clip.none,
        controller: pageController,
        itemCount: movies?.results?.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: pageController,
            builder: (context, child) {
              double value = 0;
              if (pageController.hasClients &&
                  pageController.position.haveDimensions) {
                value = pageController.page! - index;
              } else {
                value = pageController.initialPage - index.toDouble();
              }
              value = value.clamp(-1, 1);
              final double verticalOffset = value.abs() * 22.h;
              final double rotation = value * -0.1;
              return Transform(
                transform: Matrix4.identity()
                  ..translate(0.0, verticalOffset)
                  ..rotateZ(rotation),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      FeaturedDetailsScreen.routeName,
                      arguments: movies?.results![index],
                    );
                  },
                  child: FeaturedSeriesPageViewItem(
                    movie: movies?.results![index],
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
