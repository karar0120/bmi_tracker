import 'package:freezed_annotation/freezed_annotation.dart';
part 'bmi_response.g.dart';

@JsonSerializable()
class BmiMeasuresResponse {
  List<BmiResponse>? bmiMeasures;
  BmiMeasuresResponse({this.bmiMeasures});

  factory BmiMeasuresResponse.fromJson(Map<String, dynamic> json) =>
      _$BmiMeasuresResponseFromJson(json);
}

@JsonSerializable()
class BmiResponse {
  int? id;
  int? wight;
  double? height;
  int? age;
  String? gender;
  String? bmiStatus;
  String? date;
  BmiResponse({
    this.id,
    this.wight,
    this.gender,
    this.height,
    this.age,
    this.bmiStatus,
    this.date,
  });

  factory BmiResponse.fromJson(Map<String, dynamic> json) =>
      _$BmiResponseFromJson(json);
}
