

import 'package:age_processor/data/datastore/network/model/requests/upload_request.dart';
import 'package:age_processor/data/datastore/network/model/responses/basic_response.dart';

abstract class Repository {

  Future<BasicResponse> uploadRecord(UploadRequest request);
}