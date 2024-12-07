import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  // Base API URL
  static const String baseUrl = "https://api.themoviedb.org/3";

  // Endpoints
  static const String discoverMovies = "/discover/movie";

  // Image Base URL
  static const String imageBaseUrl = "https://image.tmdb.org/t/p/";

  // Image Sizes
  static const String posterSize = "w500";
  static const String backdropSize = "w780";

  // Fetch API Key from .env
  static String get apiKey => dotenv.env['API_KEY'] ?? '';
}
