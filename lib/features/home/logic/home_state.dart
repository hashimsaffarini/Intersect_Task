import 'package:intersect_task/core/networking/failure.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';

class HomeState {}

final class HomeInitial extends HomeState {}

final class GetMoviesLoading extends HomeState {}

final class GetMoviesSuccess extends HomeState {
  final MoviesResponseModel movies;

  GetMoviesSuccess(this.movies);
}

final class GetMoviesFailure extends HomeState {
  final Failure failure;

  GetMoviesFailure(this.failure);
}

final class HomeFilteredState extends HomeState {
  final List<Results> filteredMovies;

  HomeFilteredState(this.filteredMovies);
}