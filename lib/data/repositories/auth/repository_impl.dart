
import 'dart:convert';

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
  
}
