import 'package:final_project_amit56/core/app_import/app_import.dart';
import 'package:final_project_amit56/core/network/local/shared_preference.dart';
import 'package:final_project_amit56/core/routing/app_router.dart';
import 'package:final_project_amit56/core/services/services_locator.dart';
import 'package:final_project_amit56/features/addresses/logic/addresses_cubit.dart';
import 'package:final_project_amit56/features/auth/logic/auth_cubit.dart';
import 'package:final_project_amit56/features/basic_app/logic/basic_app_cubit.dart';
import 'package:final_project_amit56/features/cart/logic/cart_cubit.dart';
import 'package:final_project_amit56/features/favorite/logic/favorite_cubit.dart';
import 'package:final_project_amit56/features/home/logic/home_cubit.dart';
import 'package:final_project_amit56/features/settings/logic/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            BlocProvider(create: (BuildContext context) => sl<AuthCubit>()),
            BlocProvider(create: (BuildContext context) => sl<BasicAppCubit>()),
            BlocProvider(create: (BuildContext context) => sl<HomeCubit>()),
            BlocProvider(create: (BuildContext context) => sl<FavoriteCubit>()),
            BlocProvider(create: (BuildContext context) => sl<ProfileCubit>()),
            BlocProvider(create: (BuildContext context) => sl<CartCubit>()),
            BlocProvider(
                create: (BuildContext context) => sl<AddressesCubit>()),
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            // darkTheme: ThemeData(
            //     scaffoldBackgroundColor: Colors.black54,
            //     textTheme:
            //         TextTheme(bodyLarge: TextStyle(color: Colors.white))),
            // theme: ThemeData(
            //     scaffoldBackgroundColor: Colors.white,
            //     colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            //     useMaterial3: true,
            //     textTheme:
            //         TextTheme(bodyLarge: TextStyle(color: Colors.black))),
            // themeMode: ThemeMode.light,
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
