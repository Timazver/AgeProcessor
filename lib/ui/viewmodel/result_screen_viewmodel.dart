
import 'package:age_processor/data/datastore/network/model/requests/info_request.dart';
import 'package:rxdart/subjects.dart';

import '../../data/datastore/network/model/responses/basic_response.dart';
import '../../domain/repositories/repository.dart';

class ResultScreenViewmodel {

  Repository repository;

  ResultScreenViewmodel({this.repository});

  PublishSubject<BasicResponse> stream = PublishSubject();

  void getInfo(InfoRequest request) {
    repository.getInfo(request)
    .then((value) => stream.add(value))
    .catchError((error) => 
    {
      print(error.toString()),
      stream.addError(error)
    });
  }
}