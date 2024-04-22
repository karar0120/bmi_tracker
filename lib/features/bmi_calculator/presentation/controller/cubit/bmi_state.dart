part of 'bmi_cubit.dart';

@immutable
abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiChangeGender extends BmiState {}

class BmiIncWight extends BmiState {}

class BmiDecWight extends BmiState {}

class BmiChangeHeight extends BmiState {}

class BmiIncAge extends BmiState {}

class BmiDecAge extends BmiState {}

class BmiGetData extends BmiState {}
//
// class BmInitial extends BmState {}
//
// class BmInitial extends BmState {}
//
// class BmInitial extends BmState {}
//
// class BmInitial extends BmState {}
//
// class BmInitial extends BmState {}
