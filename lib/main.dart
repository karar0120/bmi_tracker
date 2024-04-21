import 'package:bmi_tracker/bmi_app.dart';
import 'package:bmi_tracker/core/di/dependency_injection.dart';
import 'package:bmi_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  setupGetIt();
  runApp(const BmiApp());
}
