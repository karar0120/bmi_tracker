import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bmi_tracker/core/helper/app_regex.dart';
import 'package:bmi_tracker/core/helper/extensions.dart';
import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/widget/app_text_form_field.dart';
import 'package:bmi_tracker/features/login/logic/cubit/login_cubit.dart';
import 'package:bmi_tracker/features/login/ui/widget/password_validations.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theming/color.dart';
import '../../../../core/theming/styles.dart';

class BuildFormFieldEmailAndPassword extends StatefulWidget {
  const BuildFormFieldEmailAndPassword({super.key});

  @override
  State<BuildFormFieldEmailAndPassword> createState() =>
      _BuildFormFieldEmailAndPasswordState();
}

class _BuildFormFieldEmailAndPasswordState
    extends State<BuildFormFieldEmailAndPassword> {
  bool isObscureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    passwordController =
        context.read<LoginCubit>().passwordTextEditingController;
    setupPasswordControllerListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            controller: context.read<LoginCubit>().emailTextEditingController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please Enter Your Email";
              }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            hintText: "Password",
            controller:
                context.read<LoginCubit>().passwordTextEditingController,
            isObscureText: isObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please Enter Your Password";
              }
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: isObscureText
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
          ),
          verticalSpace(24),
          PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacters: hasSpecialCharacters,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength),
          verticalSpace(18),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                context.pushNamed(Routes.forgetPasswordScreen);
              },
              child: Text(
                "Forgot Password?",
                style: TextStyles.font13BlueRegular.copyWith(
                  color: ColorsManager.mainBlue,
                  fontSize: 12.sp,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }
}
