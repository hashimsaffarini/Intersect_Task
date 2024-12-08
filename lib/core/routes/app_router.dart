import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intersect_task/core/di/dependency_injection.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';
import 'package:intersect_task/features/home/ui/featured_details_screen.dart';
import 'package:intersect_task/features/home/ui/home_screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => getIt<HomeCubit>()..fetchMovies(),
            child: const HomeScreen(),
          ),
        );
        case FeaturedDetailsScreen.routeName:
        return MaterialPageRoute(
          builder: (_) =>  FeaturedDetailsScreen(
            movie: settings.arguments as Results,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
