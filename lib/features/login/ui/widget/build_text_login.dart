import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bmi_tracker/core/helper/spacing.dart';

import '../../../../core/theming/styles.dart';

class BuildTextLogin extends StatelessWidget {
  const BuildTextLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(
          "Welcome Back",
          style: TextStyles.font24BlueBold,
        ),
        verticalSpace(8),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: TextStyles.font14GrayRegular,
        )
      ],
    );
  }
}
