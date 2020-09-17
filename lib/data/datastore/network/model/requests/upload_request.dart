import 'package:age_processor/data/datastore/network/config/backend_config.dart';
import 'package:age_processor/data/datastore/network/http_method.dart';
import 'package:age_processor/data/datastore/network/protocols/backend_request.dart';
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class UploadRequest implements BackendRequest {

  final String filePath;
  final MultipartFile multipartFile;

  UploadRequest({this.filePath, this.multipartFile});

  @JsonKey(ignore: true)
  @override
  String endpoint = "/voice/upload";

  @JsonKey(ignore: true)
  @override
  Map<String, String> headers = BackendConfig.headers;

  @JsonKey(ignore: true)
  @override
  HttpMethod method = HttpMethod.POST;

  @JsonKey(ignore: true)
  @override
  Map<String, dynamic> toJson() => {
    "voice": multipartFile
  };
}