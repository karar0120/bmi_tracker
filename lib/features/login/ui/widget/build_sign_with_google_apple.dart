import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildSignWithGoogleAndApple extends StatelessWidget {
  const BuildSignWithGoogleAndApple({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
            radius: 27.r,
            //  backgroundColor: ColorsManager.backGroundColorIcon,
            child: SvgPicture.asset("assets/svgs/google.svg")),
        SizedBox(
          width: 20.w,
        ),
        CircleAvatar(
            radius: 27.r,
            // backgroundColor: ColorsManager.backGroundColorIcon,
            child: SvgPicture.asset("assets/svgs/facebook.svg")),
        SizedBox(
          width: 20.w,
        ),
        CircleAvatar(
            radius: 27.r,
            // backgroundColor: ColorsManager.backGroundColorIcon,
            child: SvgPicture.asset("assets/svgs/apple.svg")),
      ],
    );
  }
}
