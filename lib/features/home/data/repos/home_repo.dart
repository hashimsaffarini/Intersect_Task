import 'package:dartz/dartz.dart';
import 'package:intersect_task/core/networking/api_result.dart';
import 'package:intersect_task/core/networking/error_handler.dart';
import 'package:intersect_task/features/home/data/apis/home_api_service.dart';
import 'package:intersect_task/features/home/data/models/movies_response_model.dart';

class HomeRepo {
  final HomeApiService apiService;

  HomeRepo(this.apiService);

  Future<ApiResult<MoviesResponseModel>> getMovies() async {
    try {
      final response = await apiService.getMovies();
      return Right(response);
    } catch (error) {
      final failure = ErrorHandler.handleError(error);
      return Left(failure);
    }
  }
}
