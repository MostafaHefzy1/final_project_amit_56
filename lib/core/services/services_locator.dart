import '../../features/addresses/data/repository/addresses_repository.dart';
import '../../features/addresses/data/web_services/addresses_web_services.dart';
import '../../features/addresses/logic/addresses_cubit.dart';

import '../../features/auth/data/repository/auth_repository.dart';
import '../../features/auth/data/web_services/auth_web_services.dart';
import '../../features/auth/logic/auth_cubit.dart';
import '../../features/basic_app/logic/basic_app_cubit.dart';
import '../../features/cart/data/repository/cart_repository.dart';
import '../../features/cart/data/web_services/cart_web_services.dart';
import '../../features/cart/logic/cart_cubit.dart';
import '../../features/favorite/data/repository/favorite_repository.dart';
import '../../features/favorite/data/web_services/favorite_web_services.dart';
import '../../features/favorite/logic/favorite_cubit.dart';
import '../../features/home/data/repository/home_repository.dart';
import '../../features/home/data/web_services/home_web_services.dart';
import '../../features/home/logic/home_cubit.dart';
import '../../features/settings/data/repository/profile_repository.dart';
import '../../features/settings/data/web_services/profile_web_services.dart';
import '../../features/settings/logic/profile_cubit.dart';
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

  sl.registerFactory(() => ProfileCubit(sl()));
  sl.registerLazySingleton(() => ProfileRepository(sl()));
  sl.registerLazySingleton(() => ProfileWebServices());

  sl.registerFactory(() => CartCubit(sl()));
  sl.registerLazySingleton(() => CartRepository(sl()));
  sl.registerLazySingleton(() => CartWebServices());

  sl.registerFactory(() => AddressesCubit(sl()));
  sl.registerLazySingleton(() => AddressesRepository(sl()));
  sl.registerLazySingleton(() => AddressesWebServices());
}
