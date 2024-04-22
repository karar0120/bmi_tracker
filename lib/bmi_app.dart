import 'package:bmi_tracker/core/theming/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routing/app_router.dart';

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: "BMI App",
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme,
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
