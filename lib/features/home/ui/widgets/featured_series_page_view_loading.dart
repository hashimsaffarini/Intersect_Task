import 'package:flutter/material.dart';
import 'package:intersect_task/features/home/ui/widgets/featured_series_page_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FeaturedSeriesPageViewLoading extends StatelessWidget {
  const FeaturedSeriesPageViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer(
      enabled: true,
      child: FeaturedSeriesPageView(),
    );
  }
}
