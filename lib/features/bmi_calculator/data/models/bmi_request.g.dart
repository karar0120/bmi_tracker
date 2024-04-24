// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BmiRequestBody _$BmiRequestBodyFromJson(Map<String, dynamic> json) =>
    BmiRequestBody(
      age: json['age'] as int,
      gender: json['gender'] as String,
      height: (json['height'] as num).toDouble(),
      weight: json['weight'] as int,
      bmiStatus: json['bmiStatus'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$BmiRequestBodyToJson(BmiRequestBody instance) =>
    <String, dynamic>{
      'age': instance.age,
      'gender': instance.gender,
      'height': instance.height,
      'weight': instance.weight,
      'bmiStatus': instance.bmiStatus,
      'dateTime': instance.dateTime.toIso8601String(),
    };
