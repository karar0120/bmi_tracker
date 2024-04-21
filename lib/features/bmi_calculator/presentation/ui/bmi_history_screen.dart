import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/history_list.dart';
import 'package:flutter/material.dart';

class BmiHistoryScreen extends StatelessWidget {
  const BmiHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          // controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: const [AnimlasList()],
        ),
      ),
    );
  }
}
