import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intersect_task/features/home/logic/home_state.dart';

import '../data/repos/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepo) : super(HomeState());
  final HomeRepo homeRepo;

  Future<void> fetchMovies() async {
    emit(GetMoviesLoading());
    final result = await homeRepo.getMovies();
    result.fold(
      (failure) => emit(GetMoviesFailure(failure)),
      (movies) => emit(GetMoviesSuccess(movies)),
    );
  }
}
