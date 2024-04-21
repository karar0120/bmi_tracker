import 'package:bmi_tracker/core/helper/extensions.dart';
import 'package:bmi_tracker/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bmi_tracker/core/widget/app_text_button.dart';
import 'package:bmi_tracker/features/login/logic/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      textStyle: TextStyles.font16WhiteSemiBold,
      onPressed: () {
        validateThenDoLogin(context);
      },
      buttonText: "Login",
    );
  }

  void validateThenDoLogin(BuildContext context) {
    // if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    //   context.read<LoginCubit>().emitLoginState();
    // }
    context.read<LoginCubit>().signInAnonymously();
    context.pushNamed(Routes.bmiCalculatorScreen);
  }
}
