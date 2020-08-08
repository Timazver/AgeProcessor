
import 'package:age_processor/data/datastore/network/http_method.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../config/backend_config.dart';
import '../../http_method.dart';
import '../../protocols/backend_request.dart';
part 'info_request.g.dart';

@JsonSerializable(nullable: false)
class InfoRequest implements BackendRequest {

  final String id;
  final String code;

  InfoRequest({this.code, this.id});

  @override
  String endpoint = "/voice/info";

  @override
  Map<String, String> headers = BackendConfig.headers;

  @override
  HttpMethod method = HttpMethod.GET;

  @override
  Map<String, dynamic> toJson() => {
    "id" : id,
    "code" : code
  };

}