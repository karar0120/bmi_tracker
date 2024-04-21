import 'package:bmi_tracker/core/helper/extensions.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/routing/routes.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/bmi_history_card.dart';
import 'package:flutter/material.dart';

class AnimlasList extends StatelessWidget {
  const AnimlasList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
        color: Colors.transparent,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: List.generate(10, (index) {
            if (index < 10) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.bmiResult,
                  );
                },
                child: const BmiHistoryCard(),
              );
            } else {
              // if (animalsController.isScroll == false &&
              //     animalsController.hasMore) {
              //   return const SizedBox(
              //     height: AppSize.s70,
              //     child: LoaderWidget(
              //       sizeLoader: 0.05,
              //     ),
              //   );
              // } else {
              //   if (animalsController.animalsDate.isEmpty) {
              //     return const NoRecoredsFound();
              //   } else {
              //     return const SizedBox();
              //   }
              // }
            }
            return const Center();
          }),
        ));
  }
}
