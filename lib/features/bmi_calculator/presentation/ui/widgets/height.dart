import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class Height extends StatelessWidget {
  const Height({super.key});

  @override
  Widget build(BuildContext context) {
    final bmiController = context.read<BmiCubit>();
    return Expanded(
      child: BlocBuilder<BmiCubit, BmiState>(
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppString.heightCm,
                        style: TextStyles.font14GrayRegular),
                  ],
                ),
                Expanded(
                  child: SfSlider.vertical(
                    min: AppSize.s50,
                    max: AppSize.s250,
                    value: bmiController.height,
                    interval: AppSize.s25,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 5,
                    activeColor: Theme.of(context).colorScheme.primary,
                    inactiveColor:
                        Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    onChanged: (dynamic value) {
                      bmiController.changeHeight(value);
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
