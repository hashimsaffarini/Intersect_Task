import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';
import 'package:intersect_task/features/home/logic/home_state.dart';
import 'package:intersect_task/features/home/ui/widgets/featured_series_page_view.dart';
import 'package:intersect_task/features/home/ui/widgets/featured_series_page_view_loading.dart';

class FeaturedSeriesPageViewBlocConsumer extends StatelessWidget {
  const FeaturedSeriesPageViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is GetMoviesFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failure.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is GetMoviesLoading) {
          return const FeaturedSeriesPageViewLoading();
        } else if (state is GetMoviesSuccess) {
          return FeaturedSeriesPageView(
            movies: state.movies,
          );
        }
        return const SizedBox();
      },
    );
  }
}
