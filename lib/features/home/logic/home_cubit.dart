import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';
import 'package:intersect_task/features/home/logic/home_state.dart';

import '../data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeState());
  final HomeRepo homeRepo;
  MoviesResponseModel? moviesResponse;
  List<Results>? movies = [];
  List<Results>? filteredMovies = [];
  TextEditingController searchController = TextEditingController();

  Future<void> fetchMovies() async {
    emit(GetMoviesLoading());
    final result = await homeRepo.getMovies();
    result.fold(
      (failure) => emit(GetMoviesFailure(failure)),
      (moviesResponse) {
        movies = moviesResponse.results;
        this.moviesResponse = moviesResponse;
        filteredMovies = movies;
        emit(GetMoviesSuccess(moviesResponse));
      },
    );
  }

  void reFetchMovies() {
    emit(GetMoviesSuccess(moviesResponse!));
  }

  void filterMovies(String query) {
    if (query.isEmpty) {
      filteredMovies = movies;
    } else {
      filteredMovies = movies
          ?.where(
            (movie) =>
                movie.title?.toLowerCase().contains(query.toLowerCase()) ??
                false,
          )
          .toList();
    }
    emit(HomeFilteredState(filteredMovies ?? []));
  }

  void clearSearch() {
    filteredMovies = movies;
    emit(HomeFilteredState(filteredMovies ?? []));
  }
}
