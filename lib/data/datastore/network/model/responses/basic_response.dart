import 'package:json_annotation/json_annotation.dart';
part 'basic_response.g.dart';

@JsonSerializable(nullable: true)
class BasicResponse {
  final int id;
  final String file;
  final String file_plus_20;
  final String file_plus_5;
  final String file_minus_5;
  final String file_minus_20;
  final int predicted_age;
  final String predicted_sex;
  final String status;
  final String security_code;

  BasicResponse({this.file,this.file_minus_20,this.file_minus_5,this.file_plus_20,this.file_plus_5,this.id,this.predicted_sex, this.security_code,this.predicted_age,this.status});

  factory BasicResponse.fromJson(Map<String, dynamic> json) => _$BasicResponseFromJson(json);
}