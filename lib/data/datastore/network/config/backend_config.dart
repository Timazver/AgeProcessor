import 'package:dio/dio.dart';

class BackendConfig {

  static BaseOptions options = new BaseOptions(
    baseUrl: "https://api.ageprocessor.com",
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  
  static const Map<String, String> headers = {
    "Content-Type": "multipart/form-data"
  };
  static Map<String, String> authHeaders = {
    "Content-Type": "application/json",
  };
}
