import 'dart:async';

import 'package:age_processor/data/datastore/network/model/requests/info_request.dart';
import 'package:age_processor/ui/viewmodel/result_screen_viewmodel.dart';
import 'package:flutter/material.dart';

import '../../data/datastore/network/model/responses/basic_response.dart';
import '../../data/repositories/auth/repository_impl.dart';


class ResultScreen extends StatefulWidget {

  final int id;
  final String code;

  ResultScreen({this.id, this.code}) {
  }

  @override
  State<StatefulWidget> createState() => _ResultScreenState();

}

class _ResultScreenState extends State<ResultScreen> {

  ResultScreenViewmodel _viewmodel = ResultScreenViewmodel(repository: RepositoryImpl());
  
  bool isStopped = false; //
  int count = 0;

  @override
  initState() {
    super.initState();
    sec5Timer();
  }

  sec5Timer() {
    Timer.periodic(Duration(seconds: 10), (timer) {
      if (isStopped) {
       timer.cancel();
      }
      setState(() {
         count++;
      });
      _viewmodel.getInfo(InfoRequest(code: widget.code, id: "${widget.id}"));
   });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()  { 
        setState(() {
          isStopped = true;
        });
        Navigator.pop(context);
        return Future.value(true);
      },
      child: Scaffold(
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
    ));
  }

}