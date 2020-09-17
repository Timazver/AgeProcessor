import 'package:age_processor/data/datastore/network/config/backend_config.dart';
import 'package:age_processor/data/datastore/network/http_method.dart';
import 'package:dio/dio.dart';

class NetworkService {
  Dio _dio = new Dio(BackendConfig.options);

  Future<dynamic> request(
      String url, HttpMethod method, Map<String, String> headers,
      {Map<String, dynamic> parameters}) async {
    _dio.options.headers = headers;
    Response response;
    try {
      switch (method) {
        case HttpMethod.GET:
          response = await _dio.get(url, queryParameters: parameters);
          break;
        case HttpMethod.POST:
          response = await _dio.post(url, data: parameters);
          break;
        case HttpMethod.PUT:
          response = await _dio.put(url, data: parameters);
          break;
        case HttpMethod.DELETE:
          response = await _dio.delete(url);
          break;
      }
    } on DioError catch (error) {
      print(error);
      return error.response.data;
    }
    print(response.data);
    if (response != null) {
      // if (_successCodes.contains(response.statusCode)) {
      return response.data;
      // }

    }
  }

  Future<dynamic> uploadRequest(
      String url, HttpMethod method, Map<String, String> headers,
      {FormData parameters}) async {
    //      _dio.options.headers = {
    //   Headers.contentLengthHeader: parameters.length,
    //   Headers.contentTypeHeader: "multipart/form-data"
    // };
    // print(_dio.options.headers);
    Response response;
    try {
      response = await _dio.post(url, data: parameters);
      
      // print(response.data);
      return response.data;
    } on DioError catch (error) {
      print(error);
      print(error.response.data);
      return error.response.data;
    }
  }
}
