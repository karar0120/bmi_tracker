import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/features/login/ui/widget/build_login_button.dart';
import 'package:bmi_tracker/features/login/ui/widget/build_text_login.dart';
import 'package:bmi_tracker/features/login/ui/widget/login_bloc_listener.dart';
import 'package:bmi_tracker/features/login/ui/widget/terms_and_conditions.dart';

import 'widget/build_sign_up_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const BuildTextLogin(),
              verticalSpace(24),
              const LoginButton(),
              verticalSpace(16),
              const TermsAndConditionsText(),
              verticalSpace(10),
              const DontHaveAccountText(),
              const LoginBlocListener(),
            ],
          ),
        ),
      )),
    );
  }
}
