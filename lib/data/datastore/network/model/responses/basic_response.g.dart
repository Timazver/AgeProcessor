// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse _$BasicResponseFromJson(Map<String, dynamic> json) {
  return BasicResponse(
    created_at: json['created_at'] as int,
    file: json['file'] as String,
    file_minus_20: json['file_minus_20'] as String,
    file_minus_5: json['file_minus_5'] as String,
    file_plus_20: json['file_plus_20'] as String,
    file_plus_5: json['file_plus_5'] as String,
    id: json['id'] as int,
    predicted_sex: json['predicted_sex'] as String,
    security_code: json['security_code'] as String,
    predicted_age: json['predicted_age'] as String,
    status: json['status'] as String,
    updated_at: json['updated_at'] as int,
  );
}

Map<String, dynamic> _$BasicResponseToJson(BasicResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'file': instance.file,
      'file_plus_20': instance.file_plus_20,
      'file_plus_5': instance.file_plus_5,
      'file_minus_5': instance.file_minus_5,
      'file_minus_20': instance.file_minus_20,
      'predicted_age': instance.predicted_age,
      'predicted_sex': instance.predicted_sex,
      'status': instance.status,
      'security_code': instance.security_code,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
