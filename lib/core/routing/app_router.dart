import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/bmi_history_screen.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/result_screen.dart';
import 'package:bmi_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_tracker/core/di/dependency_injection.dart';
import 'package:bmi_tracker/core/routing/routes.dart';
import '../../features/bmi_calculator/presentation/ui/bmi_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.bmiCalculatorScreen:
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => getIt<LoginCubit>()..signInAnonymously(),
                  child: BlocProvider<BmiCubit>(
                    create: (context) => getIt<BmiCubit>(),
                    child: const BmiFrom(),
                  ),
                ));
      case Routes.bmiResult:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                  value: BlocProvider.of<BmiCubit>(
                      settings.arguments as BuildContext),
                  child: ResultScreen(
                    bmiContext: settings.arguments as BuildContext,
                  ),
                ));
      case Routes.historyBmi:
        return MaterialPageRoute(
            builder: (context) => BlocProvider<BmiCubit>(
                  create: (context) => getIt<BmiCubit>()..refreshData(),
                  child: const BmiHistoryScreen(),
                ));

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
