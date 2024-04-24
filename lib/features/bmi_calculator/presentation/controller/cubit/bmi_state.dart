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

class GetBmiLoading extends BmiState {}

class GetBmiLoaded extends BmiState {}

class GetBmiError extends BmiState {
  final String error;
  GetBmiError({required this.error});
}

class DeleteBmiLoading extends BmiState {}

class DeleteBmiLoaded extends BmiState {}

class DeleteBmiError extends BmiState {
  final String error;
  DeleteBmiError({required this.error});
}

class UpdateBmiLoading extends BmiState {}

class UpdateBmiLoaded extends BmiState {}

class UpdateBmiError extends BmiState {
  final String error;
  UpdateBmiError({required this.error});
}

class AddBmiLoading extends BmiState {}

class AddBmiLoaded extends BmiState {}

class AddBmiError extends BmiState {
  final String error;
  AddBmiError({required this.error});
}

class BmiIncrementsNumberPage extends BmiState {}
