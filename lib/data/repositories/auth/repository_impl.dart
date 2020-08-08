
import 'dart:convert';

import 'package:age_processor/data/datastore/network/model/requests/info_request.dart';
import 'package:age_processor/data/datastore/network/model/responses/basic_response.dart';
import 'package:age_processor/data/datastore/network/model/requests/upload_request.dart';
import 'package:age_processor/data/datastore/network/services/backend_service.dart';
import 'package:age_processor/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {

  @override
  Future<BasicResponse> uploadRecord(UploadRequest request) async {
    
    var response = await BackendService.backendService.uploadRequest(request).catchError((error) {
      return error;
    });
    if(response != null) {
      return response;
    }

  }

  @override
  Future<BasicResponse> getInfo(InfoRequest request) async {
     var response = await BackendService.backendService.request(request).catchError((error) {
      //  print(error);
      return Future.error(error);
    });
    if(response != null) {
      return response;
    }
  }
  
}
