import 'package:bmi_tracker/features/bmi_calculator/ui/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_tracker/core/di/dependency_injection.dart';
import 'package:bmi_tracker/core/routing/routes.dart';
import 'package:bmi_tracker/features/login/logic/cubit/login_cubit.dart';
import '../../features/login/ui/login_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<LoginCubit>(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.bmiCalculatorScreen:
        return MaterialPageRoute(builder: (context) => const BmiFrom());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("No Route Found"),
              ),
              body: const Center(child: Text("No Route Found")),
            ));
  }
}
