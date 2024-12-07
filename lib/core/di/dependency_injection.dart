import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intersect_task/core/networking/dio_factory.dart';
import 'package:intersect_task/features/home/data/apis/home_api_service.dart';
import 'package:intersect_task/features/home/data/repos/home_repo.dart';
import 'package:intersect_task/features/home/logic/home_cubit.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  ///Dio & ApiService
  Dio dio = DioFactory.getDio();

  //* home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));

  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
}
