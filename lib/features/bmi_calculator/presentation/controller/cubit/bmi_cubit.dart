import 'package:bloc/bloc.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_request.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_response.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/repos/irepository.dart';
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
  Color colorStattus = const Color(0xff246AFE);

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
    findStatus();
    addBmiDetailsToFirestore();
  }

  void findStatus() {
    if (tempBMI < 18.5) {
      bmiStatus = "UnderWeight";
      colorStattus = const Color(0xffFFB800);
    }
    if (tempBMI > 18.5 && tempBMI < 24.9) {
      bmiStatus = "Normal";
      colorStattus = const Color(0xff00CA39);
    }
    if (tempBMI > 25.0 && tempBMI < 29.9) {
      bmiStatus = "OverWeight";
      colorStattus = const Color(0xffFF5858);
    }
    if (tempBMI > 30.0 && tempBMI < 34.9) {
      bmiStatus = "OBESE";
      colorStattus = const Color(0xffFF0000);
    }
    if (tempBMI > 35.0) {
      bmiStatus = "Extremely OBESE";

      colorStattus = const Color(0xff000000);
    }
  }

  Future<void> addBmiDetailsToFirestore() async {
    await bmiRepo.addBmiMeasures(BmiRequestBody(
        age: age,
        gender: gender,
        height: height,
        weight: weight,
        bmiStatus: bmiStatus,
        dateTime: DateTime.now()));
  }

  List<BmiResponse> bmiItems = [];

  int limit = 15;
  int pageNo = 1;
  bool hasMore = true;
  bool isLoaded = false;
  bool isScroll = true;

  void incrementsNumberPage() {
    pageNo++;
    isLoaded = false;
    //emit(const AnimalsState.incrementsNumberPage());
  }

  Future<void> refreshData() async {
    bmiItems.clear();
    isScroll = false;
    isLoaded = false;
    hasMore = true;
    pageNo = 1;
    //emitGetAnimalsState();
  }

  Future getToFirestore() async {
    if (isLoaded) return;
    isLoaded = true;
    isScroll = false;
    final result = await bmiRepo.getBmiMeasures();
    result.when(
        success: (value) {
          bmiItems = value;
          isLoaded = false;
          incrementsNumberPage();
          if (bmiItems.length < limit) {
            hasMore = false;
          }
          isScroll = true;
        },
        failure: (error) {});
    emit(BmiGetData());
  }
}
