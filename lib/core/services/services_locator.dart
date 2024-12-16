import 'package:final_project_amit56/features/auth/data/repository/auth_repository.dart';
import 'package:final_project_amit56/features/auth/data/web_services/auth_web_services.dart';
import 'package:final_project_amit56/features/auth/logic/auth_cubit.dart';
import 'package:final_project_amit56/features/basic_app/logic/basic_app_cubit.dart';
import 'package:final_project_amit56/features/favorite/data/repository/favorite_repository.dart';
import 'package:final_project_amit56/features/favorite/data/web_services/favorite_web_services.dart';
import 'package:final_project_amit56/features/favorite/logic/favorite_cubit.dart';
import 'package:final_project_amit56/features/home/data/repository/home_repository.dart';
import 'package:final_project_amit56/features/home/data/web_services/home_web_services.dart';
import 'package:final_project_amit56/features/home/logic/home_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> initGetIt() async {
  sl.registerFactory(() => AuthCubit(sl()));
  sl.registerLazySingleton(() => AuthRepository(sl()));
  sl.registerLazySingleton(() => AuthWebServices());

  sl.registerFactory(() => BasicAppCubit());
  // sl.registerLazySingleton(() => HomeRepository(sl()));
  // sl.registerLazySingleton(() => HomeWebServices());

  sl.registerFactory(() => HomeCubit(sl())
    ..getBanners()
    ..getCategories()
    ..getProducts());
  sl.registerLazySingleton(() => HomeRepository(sl()));
  sl.registerLazySingleton(() => HomeWebServices());

  sl.registerFactory(() => FavoriteCubit(sl())..favoritesProduct());
  sl.registerLazySingleton(() => FavoriteRepository(sl()));
  sl.registerLazySingleton(() => FavoriteWebServices());
}
