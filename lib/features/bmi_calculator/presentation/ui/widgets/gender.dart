import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gender extends StatelessWidget {
  final IconData icon;
  final String btnName;
  final VoidCallback onPress;
  const Gender(
      {super.key,
      required this.icon,
      required this.btnName,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    final bmiController = context.read<BmiCubit>();
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Container(
          height: AppSize.s50,
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s10),
              color: bmiController.gender == btnName
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.primaryContainer),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color: bmiController.gender == btnName
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.primary),
              horizontalSpace(AppSize.s10),
              Text(
                btnName,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    color: bmiController.gender == btnName
                        ? Theme.of(context).colorScheme.primaryContainer
                        : Theme.of(context).colorScheme.primary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
