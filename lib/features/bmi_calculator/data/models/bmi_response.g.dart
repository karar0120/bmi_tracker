// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bmi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BmiMeasuresResponse _$BmiMeasuresResponseFromJson(Map<String, dynamic> json) =>
    BmiMeasuresResponse(
      bmiMeasures: (json['bmiMeasures'] as List<dynamic>?)
          ?.map((e) => BmiResponse.fromJson(e as Map<String, dynamic>, ''))
          .toList(),
    );

Map<String, dynamic> _$BmiMeasuresResponseToJson(
        BmiMeasuresResponse instance) =>
    <String, dynamic>{
      'bmiMeasures': instance.bmiMeasures,
    };

BmiResponse _$BmiResponseFromJson(Map<String, dynamic> json, String id) =>
    BmiResponse(
      id: id,
      weight: json['weight'] as int?,
      gender: json['gender'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      age: json['age'] as int?,
      bmiStatus: json['bmiStatus'] as String?,
    );

Map<String, dynamic> _$BmiResponseToJson(BmiResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'wight': instance.weight,
      'height': instance.height,
      'age': instance.age,
      'gender': instance.gender,
      'bmiStatus': instance.bmiStatus,
    };
