import 'package:freezed_annotation/freezed_annotation.dart';
part 'bmi_request.g.dart';

@JsonSerializable()
class BmiRequestBody {
  final int age;
  final String gender;
  final double height;
  final int weight;
  final String bmiStatus;
  final DateTime dateTime;
  BmiRequestBody({
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.bmiStatus,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() => _$BmiRequestBodyToJson(this);
}
