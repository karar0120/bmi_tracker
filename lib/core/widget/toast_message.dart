import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

void errorBotToast({required String title}) {
  BotToast.showSimpleNotification(
      title: title,
      titleStyle: TextStyles.font16WhiteMedium,
      closeIcon: const Icon(Icons.close_rounded),
      hideCloseButton: false,
      subTitleStyle: TextStyles.font16WhiteMedium,
      backgroundColor: Colors.red,
      borderRadius: 14.0);
}

void doneBotToast({required String title}) {
  BotToast.showSimpleNotification(
      titleStyle: TextStyles.font16WhiteMedium,
      closeIcon: const Icon(Icons.check),
      hideCloseButton: false,
      title: title,
      subTitleStyle: TextStyles.font16WhiteMedium,
      backgroundColor: Colors.green,
      borderRadius: 14.0);
}
