import 'package:dio/dio.dart';
import 'package:intersect_task/core/networking/failure.dart';

class ErrorHandler {
  static Failure handleError(dynamic error) {
    if (error is DioException) {
      return _handleDioError(error);
    } else {
      return Failure("Unexpected error occurred");
    }
  }

  static Failure _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return Failure("Connection timeout. Please try again.");
      case DioExceptionType.sendTimeout:
        return Failure("Send timeout. Please try again.");
      case DioExceptionType.receiveTimeout:
        return Failure("Receive timeout. Please try again.");
      case DioExceptionType.badResponse:
        //* Handle TMDB-specific errors (invalid API key, ...etc)
        if (error.response?.statusCode == 401) {
          return Failure("Unauthorized. Invalid API key.", code: 401);
        } else if (error.response?.statusCode == 404) {
          return Failure("Resource not found", code: 404);
        } else if (error.response?.statusCode == 500) {
          return Failure("Internal server error", code: 500);
        } else {
          return Failure(
            error.response?.statusMessage ?? "Unknown server error",
            code: error.response?.statusCode,
          );
        }
      case DioExceptionType.cancel:
        return Failure("Request was cancelled");
      case DioExceptionType.unknown:
        return Failure("Network error. Please check your internet connection.");
      default:
        return Failure("Unexpected error occurred");
    }
  }
}
