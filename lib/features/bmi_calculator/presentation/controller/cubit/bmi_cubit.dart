import 'package:bloc/bloc.dart';
import 'package:bmi_tracker/core/helper/extensions.dart';
import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/widget/toast_message.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_request.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_response.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/repos/irepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  final BmiRepo bmiRepo;
  BmiCubit({required this.bmiRepo}) : super(BmiInitial());

  String gender = "MALE";
  int weight = 50;
  int age = 25;
  double height = 100.0;
  String bmi = "";
  double tempBMI = 0.0;
  String bmiStatus = "";
  Color colorStatus = const Color(0xff246AFE);

  void changeGender(String value) {
    gender = value;
    emit(BmiChangeGender());
  }

  void incWeight() {
    ++weight;
    emit(BmiIncWight());
  }

  void deceWeight() {
    weight--;
    emit(BmiDecWight());
  }

  void changeHeight(dynamic value) {
    height = value;
    emit(BmiChangeHeight());
  }

  void decAge() {
    age--;
    emit(BmiDecAge());
  }

  void incAge() {
    age++;
    emit(BmiIncAge());
  }

  void calculatBMI() {
    var heightMeter = height / 100;
    tempBMI = weight / (heightMeter * heightMeter);
    bmi = tempBMI.toStringAsFixed(1);
    tempBMI = double.parse(bmi);
    bmiStatus = findStatus(tempBMI);
    colorStatus = findColor(tempBMI);
    addBmi();
  }

  void updateCalculatBMI(
    id,
    BuildContext context,
  ) {
    var heightMeter = height / 100;
    tempBMI = weight / (heightMeter * heightMeter);
    bmi = tempBMI.toStringAsFixed(1);
    tempBMI = double.parse(bmi);
    bmiStatus = findStatus(tempBMI);
    colorStatus = findColor(tempBMI);
    updateBmi(id, context);
  }

  Future<void> addBmi() async {
    emit(AddBmiLoading());
    final result = await bmiRepo.addBmiMeasures(
      BmiRequestBody(
          age: age,
          gender: gender,
          height: height,
          weight: weight,
          bmiStatus: bmiStatus,
          dateTime: DateTime.now()),
    );
    result.when(success: (value) {
      doneBotToast(title: AppString.savedSuccessfully);
      emit(AddBmiLoaded());
    }, failure: (error) {
      errorBotToast(title: error.toString());
      emit(AddBmiError(error: error.toString()));
    });
  }

  List<BmiResponse> bmiItems = [];

  int limit = 15;
  int pageNo = 1;
  DocumentSnapshot? lastDocument;
  bool hasMore = true;
  bool isLoaded = false;
  bool isScroll = true;

  void incrementsNumberPage() {
    pageNo++;
    isLoaded = false;
    emit(BmiIncrementsNumberPage());
  }

  Future<void> refreshData() async {
    bmiItems.clear();
    isScroll = false;
    isLoaded = false;
    hasMore = true;
    pageNo = 1;
    lastDocument = null;
    getBmi();
  }

  Future getBmi() async {
    emit(GetBmiLoading());
    if (isLoaded) return;
    isLoaded = true;
    isScroll = false;
    final result = await bmiRepo.getBmiMeasures(lastDocument);
    result.when(success: (value) {
      bmiItems.addAll(value);
      isLoaded = false;
      incrementsNumberPage();
      if (bmiItems.length < limit) {
        hasMore = false;
      }
      isScroll = true;
      emit(GetBmiLoaded());
    }, failure: (error) {
      emit(GetBmiError(error: error.toString()));
    });
  }

  Future deleteBmi(String id) async {
    final result = await bmiRepo.deleteBmiMeasures(id);
    emit(DeleteBmiLoading());
    result.when(success: (value) {
      doneBotToast(title: AppString.savedSuccessfully);
      refreshData();
      emit(DeleteBmiLoaded());
    }, failure: (error) {
      errorBotToast(title: error.toString());
      emit(DeleteBmiError(error: error.toString()));
    });
  }

  Future<void> updateBmi(String id, BuildContext context) async {
    emit(UpdateBmiLoading());
    final result = await bmiRepo.updateBmiMeasures(
        id,
        BmiRequestBody(
            age: age,
            gender: gender,
            height: height,
            weight: weight,
            bmiStatus: bmiStatus,
            dateTime: DateTime.now()));
    result.when(success: (value) {
      refreshData();
      context.pop();
      doneBotToast(title: AppString.savedSuccessfully);
      emit(UpdateBmiLoaded());
    }, failure: (error) {
      errorBotToast(title: error.toString());
      emit(UpdateBmiError(error: error.toString()));
    });
  }

  Future<void> getBmiById(String id) async {
    emit(GetBmiByIdLoading());
    final result = await bmiRepo.getBmiById(
      id,
    );
    result.when(success: (value) {
      age = value.age!;
      height = value.height!;
      weight = value.weight!;
      gender = value.gender!;
      bmiStatus = value.bmiStatus!;
      emit(GetBmiByIdLoaded());
    }, failure: (error) {
      emit(GetBmiByIdError(error: error.toString()));
    });
  }
}
