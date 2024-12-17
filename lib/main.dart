import 'core/bloc_observer/bloc_observer.dart';
import 'core/network/global/dio_helper.dart';
import 'core/network/local/shared_preference.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/services/services_locator.dart';
import 'features/auth/logic/auth_cubit.dart';
import 'features/basic_app/logic/basic_app_cubit.dart';
import 'features/cart/logic/cart_cubit.dart';
import 'features/favorite/logic/favorite_cubit.dart';
import 'features/home/logic/home_cubit.dart';
import 'features/settings/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.initDioHelper();
  initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            //  BlocProvider(
            //     create: (BuildContext context) =>
            //         AuthCubit(AuthRepository(AuthWebServices()))),
            BlocProvider(create: (BuildContext context) => sl<AuthCubit>()),
            BlocProvider(create: (BuildContext context) => sl<BasicAppCubit>()),
            BlocProvider(create: (BuildContext context) => sl<HomeCubit>()),
            BlocProvider(create: (BuildContext context) => sl<FavoriteCubit>()),
            BlocProvider(create: (BuildContext context) => sl<ProfileCubit>()),
            BlocProvider(create: (BuildContext context) => sl<CartCubit>()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: CacheHelper.getData(key: "token") == null
                ? Routes.loginScreen
                : Routes.bottomNavBarScreen,
            onGenerateRoute: AppRouter.genrateRoute,
          ),
        );
      },
    );
  }
}
