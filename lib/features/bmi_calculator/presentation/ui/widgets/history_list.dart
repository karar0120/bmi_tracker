import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/widget/button_sheet.dart';
import 'package:bmi_tracker/core/widget/loader.dart';
import 'package:bmi_tracker/core/widget/no_record_found.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/bmi_history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiList extends StatelessWidget {
  const BmiList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmiController = context.read<BmiCubit>();
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
            color: Colors.transparent,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              children:
                  List.generate(bmiController.bmiItems.length + 1, (index) {
                if (index < bmiController.bmiItems.length) {
                  return GestureDetector(
                    onTap: () {
                      showCustomBottomSheet(context,
                          bottomSheetContent: BlocProvider<BmiCubit>.value(
                            value: context.read<BmiCubit>(),
                            child: ButtonSheet(
                                id: bmiController.bmiItems[index].id!),
                          ),
                          bottomSheetHeight: 0.25);
                    },
                    child: BmiHistoryCard(
                      bmiResponse: bmiController.bmiItems[index],
                    ),
                  );
                } else {
                  if (bmiController.isScroll == false &&
                      bmiController.hasMore) {
                    return const SizedBox(
                      height: AppSize.s70,
                      child: LoaderWidget(
                        sizeLoader: 0.05,
                      ),
                    );
                  } else {
                    if (bmiController.bmiItems.isEmpty) {
                      return const NoRecoredsFound();
                    } else {
                      return const SizedBox();
                    }
                  }
                }
              }),
            ));
      },
    );
  }
}
