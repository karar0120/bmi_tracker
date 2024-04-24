import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/theming/color.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showCustomBottomSheet(BuildContext context,
    {required Widget bottomSheetContent,
    required double bottomSheetHeight,
    Color? backgroundColor}) {
  showModalBottomSheet(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          height: bottomSheetHeight.sh,
          child: Stack(
            children: [
              Positioned(
                right: 0.4.sw,
                left: 0.4.sw,
                top: 10,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: 5,
                  decoration: BoxDecoration(
                      color: ColorsManager.gray,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              bottomSheetContent
            ],
          ),
        );
      });
}

class ButtonSheet extends StatelessWidget {
  final String id;
  const ButtonSheet({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final bmiController = context.read<BmiCubit>();
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p40, vertical: AppPadding.p40),
      children: [
        InkWell(
          onTap: () {
            bmiController.updateBmi(id);
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: Center(
              child: Text(AppString.edit, style: TextStyles.font16WhiteMedium),
            ),
          ),
        ),
        const Divider(),
        InkWell(
          onTap: () {
            bmiController.deleteBmi(id);
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p10),
            child: Center(
              child: Text(AppString.delete,
                  style:
                      TextStyles.font16WhiteMedium.copyWith(color: Colors.red)),
            ),
          ),
        )
      ],
    );
  }
}
