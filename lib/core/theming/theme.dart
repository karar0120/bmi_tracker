import 'package:bmi_tracker/core/theming/color.dart';
import 'package:flutter/material.dart';

var darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    background: ColorsManager.darkBlue,
    primary: ColorsManager.mainBlue,
    onBackground: ColorsManager.white,
    primaryContainer: ColorsManager.darkGrey,
    onPrimaryContainer: ColorsManager.white,
    onSecondaryContainer: ColorsManager.gray,
  ),
);
