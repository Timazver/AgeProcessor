import 'dart:async';

import 'package:age_processor/data/datastore/network/model/requests/info_request.dart';
import 'package:age_processor/ui/viewmodel/result_screen_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../data/datastore/network/model/responses/basic_response.dart';
import '../../data/repositories/auth/repository_impl.dart';

bool isStopped = false; //
int count = 0;
class ResultScreen extends StatelessWidget {

  final int id;
  final String code;

  ResultScreen({this.id, this.code}) {
    // InfoRequest request = InfoRequest(endpoint: "/info/$id/$code");
    sec5Timer();
  }

  ResultScreenViewmodel _viewmodel = ResultScreenViewmodel(repository: RepositoryImpl());
  

  sec5Timer() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      if (isStopped) {
       timer.cancel();
      }
      count++;
      // var request = InfoRequest(endpoint: "/voice/info");
      _viewmodel.getInfo(InfoRequest(code: code, id: "${id}"));
      // _viewmodel.getInfo(InfoRequest(endpoint: "/info?id=$id&code=$code"));
   });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text('Result'),
        ),
        body: StreamBuilder(
          stream: _viewmodel.stream,
          builder: (context, AsyncSnapshot<BasicResponse> snapshot) {
            print(snapshot.hasData);
            if(snapshot.hasError) {
              print(snapshot.error.toString());
            }
            if(snapshot.hasData && snapshot.data.predicted_age != null) {
              isStopped = true;
              return Center(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Ваш возраст: ${snapshot.data.predicted_age}\n", style: TextStyle(fontSize: 18, color: Colors.black)),
                      TextSpan(text: "Ваш пол: ${snapshot.data.predicted_sex}", style: TextStyle(fontSize: 18, color: Colors.black))
                    ]
                  ),
                ));
            } else if(count >= 12) {
              return Center(child:Text("Извините возникла ошибка, попробуйте позже"));
            }
            return Center(child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Подождите идет обработка записи..."),
                SizedBox(height: 5),
                CircularProgressIndicator()
              ],
            ));
          })
    );
  }

}