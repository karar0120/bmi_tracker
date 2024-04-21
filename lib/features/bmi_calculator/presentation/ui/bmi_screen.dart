import 'package:bmi_tracker/core/helper/extensions.dart';
import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/routing/routes.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bmi_tracker/core/widget/app_text_button.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/age.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/height.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/gender.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/weight.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/drawar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiFrom extends StatelessWidget {
  const BmiFrom({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = context.read<BmiCubit>();
    return Scaffold(
      drawer: const MyDrawer(),
      body: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.welcome,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppString.bmiCalculator,
                        style: TextStyles.font32BlueBold,
                      ),
                      InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: const Icon(Icons.menu)),
                    ],
                  ),
                  verticalSpace(AppSize.s20),
                  Row(
                    children: [
                      Gender(
                        onPress: () {
                          bmiController.changeGender(AppString.male);
                        },
                        icon: Icons.male,
                        btnName: AppString.male,
                      ),
                      horizontalSpace(AppSize.s10),
                      Gender(
                        onPress: () {
                          bmiController.changeGender(AppString.female);
                        },
                        icon: Icons.female,
                        btnName: AppString.female,
                      ),
                    ],
                  ),
                  verticalSpace(AppSize.s20),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Height(),
                        horizontalSpace(AppSize.s20),
                        const Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Weight(),
                              Age(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  verticalSpace(AppSize.s10),
                  AppTextButton(
                    onPressed: () {
                      bmiController.calculatBMI();
                      context.pushNamed(Routes.bmiResult, arguments: context);
                    },
                    buttonText: AppString.letsGo,
                    textStyle: TextStyles.font16WhiteMedium,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
