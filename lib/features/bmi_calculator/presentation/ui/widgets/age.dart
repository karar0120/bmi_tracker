import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:bmi_tracker/core/widget/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = context.read<BmiCubit>();
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(AppPadding.p10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s10),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          height: AppSize.s200,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppString.age, style: TextStyles.font14GrayRegular),
                ],
              ),
              verticalSpace(AppSize.s10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${bmiController.age}",
                      style: TextStyles.font60WhiteBold),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SecBtn(
                    onpress: () {
                      bmiController.incAge();
                    },
                    icon: Icons.add,
                  ),
                  SecBtn(
                    onpress: () {
                      bmiController.decAge();
                    },
                    icon: Icons.minimize,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
