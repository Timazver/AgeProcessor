
import 'package:age_processor/data/datastore/network/model/requests/upload_request.dart';
import 'package:age_processor/data/datastore/network/model/responses/basic_response.dart';
import 'package:age_processor/domain/repositories/repository.dart';
import 'package:rxdart/subjects.dart';

class MainScreenViewmodel {

  Repository repository;

  MainScreenViewmodel({this.repository});

  PublishSubject<BasicResponse> basicRespStream = PublishSubject();

  void uploadRecord(UploadRequest request) {
    repository.uploadRecord(request).then((value) => {
      if(value != null) {
        basicRespStream.add(value)
      }
    })
    .catchError((error) {
      basicRespStream.addError(error);
    });
  }
}