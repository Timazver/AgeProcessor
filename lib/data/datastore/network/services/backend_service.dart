import 'package:age_processor/data/datastore/network/model/responses/basic_response.dart';
import 'package:age_processor/data/datastore/network/protocols/backend_request.dart';
import 'package:age_processor/data/datastore/network/services/network_service.dart';
import 'package:dio/dio.dart';

class BackendService {
  static final BackendService backendService = BackendService._internal();

  NetworkService _networkService;

  BackendService._internal() {
    _networkService = NetworkService();
  }

  Future<BasicResponse> request(BackendRequest request) async {
    BasicResponse baseResponse;

    try {
      var response = await _networkService.request(
          request.endpoint, request.method, request.headers,
          parameters: request.toJson());
      baseResponse = BasicResponse.fromJson(response);
      return baseResponse;
    } catch (error) {
      return error;
    }
  }

  Future<BasicResponse> uploadRequest(BackendRequest request) async {
    
    BasicResponse baseResponse;
    try {
      var response = await _networkService.uploadRequest(
          request.endpoint, request.method, request.headers,
          parameters: FormData.fromMap(request.toJson()));
      baseResponse = BasicResponse.fromJson(response);
      return baseResponse;
    } catch (error) {
      return error;
    }
  }
}
