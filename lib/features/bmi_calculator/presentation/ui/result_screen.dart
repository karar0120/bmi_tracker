import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bmi_tracker/core/widget/app_bar.dart';
import 'package:bmi_tracker/core/widget/app_text_button.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultScreen extends StatelessWidget {
  final BuildContext bmiContext;
  const ResultScreen({super.key, required this.bmiContext});

  @override
  Widget build(BuildContext context) {
    final bmiController = BlocProvider.of<BmiCubit>(bmiContext);
    return Scaffold(
      appBar: const GeneralAppBar(
        title: Text("Your BMI"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p10),
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(AppSize.s10),
              Row(
                children: [
                  Text("Your BMI is", style: TextStyles.font24BlueBold),
                ],
              ),
              verticalSpace(AppSize.s10),
              SizedBox(
                height: AppSize.s350,
                child: Expanded(
                  child: CircularPercentIndicator(
                    animationDuration: 1000,
                    footer: Text(bmiController.bmiStatus,
                        style: TextStyles.font32BlueBold),
                    radius: AppSize.s140,
                    lineWidth: AppSize.s30,
                    animation: true,
                    circularStrokeCap: CircularStrokeCap.round,
                    percent: bmiController.tempBMI / 100,
                    center: Text(
                      "${bmiController.bmi}%",
                      style: TextStyle(
                          color: bmiController.colorStattus,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    progressColor: bmiController.colorStattus,
                    backgroundColor:
                        bmiController.colorStattus.withOpacity(0.2),
                  ),
                ),
              ),
              verticalSpace(AppSize.s20),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                padding: const EdgeInsets.all(AppPadding.p10),
                child: const Text(
                    "Your BMI is 20.7, indicating your weight is in the Normal category for adults of your height.  For your height, a normal weight range wouldbe from 53.5 to 72 kilograms.Maintaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity."),
              ),
              verticalSpace(AppSize.s20),
              AppTextButton(
                onPressed: () {
                  bmiController.getPaginatedBMIDetails(10);
                  // context.pop();
                },
                buttonText: "Find Out More",
                textStyle: TextStyles.font16WhiteMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}
