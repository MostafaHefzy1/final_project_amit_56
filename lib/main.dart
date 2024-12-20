import 'package:final_project_amit56/app.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/network/global/dio_helper.dart';
import 'core/network/local/shared_preference.dart';
import 'core/services/services_locator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.initDioHelper();
  initGetIt();
  runApp(const MyApp());
}
