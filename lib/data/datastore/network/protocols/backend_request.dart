import 'package:age_processor/data/datastore/network/http_method.dart';

abstract class BackendRequest {

  String endpoint;
  HttpMethod method;
  // Map<String, dynamic> parameters;

  Map<String, String> headers;

  Map<String, dynamic> toJson();
}
