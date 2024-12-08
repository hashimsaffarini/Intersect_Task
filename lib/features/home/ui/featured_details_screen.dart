import 'package:flutter/material.dart';
import 'package:intersect_task/core/theming/app_colors.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';
import 'package:intersect_task/features/home/ui/widgets/featured_detailes_screen_body.dart';

class FeaturedDetailsScreen extends StatelessWidget {
  const FeaturedDetailsScreen({super.key, required this.movie});
  static const String routeName = 'featuredDetailsScreen';
  final Results movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FeaturedDetailsScreenBody(
        movie: movie,
      ),
    );
  }
}
