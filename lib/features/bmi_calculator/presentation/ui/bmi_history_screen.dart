import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/widget/app_bar.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/controller/cubit/bmi_cubit.dart';
import 'package:bmi_tracker/features/bmi_calculator/presentation/ui/widgets/history_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiHistoryScreen extends StatefulWidget {
  const BmiHistoryScreen({super.key});

  @override
  State<BmiHistoryScreen> createState() => _BmiHistoryScreenState();
}

class _BmiHistoryScreenState extends State<BmiHistoryScreen> {
  ScrollController scrollController = ScrollController();
  _bind() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<BmiCubit>().getToFirestore();
      }
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const GeneralAppBar(
        title: Text(AppString.bmiHistory),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: const [BmiList()],
        ),
      ),
    );
  }
}
