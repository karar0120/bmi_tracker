import 'package:bmi_tracker/core/helper/shared_preferences.dart';
import 'package:bmi_tracker/core/networking/api_service.dart';
import 'package:bmi_tracker/core/networking/dio_factory.dart';
import 'package:bmi_tracker/core/networking/netwotk_info.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/repos/irepository.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:bmi_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  getIt.registerLazySingleton<NetworkInfo>(() =>
      NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()));
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  final sharedPreferences = await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<AppPreferences>(
      () => AppPreferences(sharedPreferences: getIt()));

  // login
  getIt.registerLazySingleton<BmiRepo>(() => BmiRepo(
        getIt<AppPreferences>(),
        getIt<NetworkInfo>(),
        FirebaseFirestore.instance,
      ));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AppPreferences>()));

  getIt.registerFactory<BmiCubit>(() => BmiCubit(bmiRepo: getIt<BmiRepo>()));
}
