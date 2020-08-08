import 'dart:io';
import 'package:age_processor/data/datastore/network/config/backend_config.dart';
import 'package:age_processor/data/datastore/network/http_method.dart';
import 'package:age_processor/data/datastore/network/protocols/backend_request.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(nullable: false)
class UploadRequest implements BackendRequest {

  final String filePath;

  UploadRequest({this.filePath});

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
    "voice": MultipartFile.fromFileSync(filePath, filename: "record.wav", contentType: MediaType("audio/mpeg", ".wav"))
  };
}