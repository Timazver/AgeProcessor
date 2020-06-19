
import 'package:json_annotation/json_annotation.dart';
part 'basic_response.g.dart';

@JsonSerializable(nullable: false)
class BasicResponse {
  final int id;
  final String file;
  final String file_plus_20;
  final String file_plus_5;
  final String file_minus_5;
  final String file_minus_20;
  final String predicted_age;
  final String predicted_sex;
  final String status;
  final String security_code;
  final int created_at;
  final int updated_at;

  BasicResponse({this.created_at, this.file,this.file_minus_20,this.file_minus_5,this.file_plus_20,this.file_plus_5,this.id,this.predicted_sex, this.security_code,this.predicted_age,this.status,this.updated_at});

  factory BasicResponse.fromJson(Map<String, dynamic> json) => _$BasicResponseFromJson(json);
}