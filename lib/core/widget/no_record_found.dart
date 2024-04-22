import 'package:bmi_tracker/core/helper/constances.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:flutter/material.dart';

class NoRecoredsFound extends StatelessWidget {
  const NoRecoredsFound({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        height: AppSize.s70,
        child: Center(child: Text(Constances.noRecoredsFound)));
  }
}
