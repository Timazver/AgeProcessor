import 'dart:io';
import 'package:age_processor/data/datastore/network/model/requests/upload_request.dart';
import 'package:age_processor/data/repositories/auth/repository_impl.dart';
import 'package:age_processor/ui/viewmodel/main_screen_viewmodel.dart';
import 'package:age_processor/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_progress_bar/flutter_rounded_progress_bar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';

class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {

  String statusText = "";
  bool isComplete = false;
  String recordFilePath;
  int i = 0;
  double percent;

  @override
  initState() {
    super.initState();
    _viewModel.basicRespStream.listen((value) {
      AppUtils.showError(context, "Ок", "Файл ${value.file} был успешно загружен.");
    })
    .onError((error) {
      AppUtils.showError(context, "Ошибка", error);
    });

    AppUtils.percent.listen((value) {
      setState(() {
        percent = value;
      });
    });
  }

  MainScreenViewmodel _viewModel = MainScreenViewmodel(repository: RepositoryImpl());

   
Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording...";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath, (type) {
        statusText = "Record error--->$type";
        setState(() {});
      });
    } else {
      statusText = "No microphone permission";
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording pause...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Record complete";
      isComplete = true;
      setState(() {});
    }
    // print(File(recordFilePath));
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording...";
      setState(() {});
    }
  }

  

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Age Processor'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
          SizedBox(height: 30),
           GestureDetector(
                  child: Container(
                    width: 200,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade300),
                    child: Center(
                      child: Text(
                        'Record',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () async {
                    startRecord();
                  },
                
              ),
              SizedBox(height: 20),
              GestureDetector(
                  child: Container(
                    width: 200,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade300),
                    child: Center(
                      child: Text(
                        'stop',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    stopRecord();
                  },
                ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Text(
              statusText,
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              _viewModel.uploadRecord(UploadRequest(filePath: recordFilePath));
            },
            child: Container(
              margin: EdgeInsets.only(top: 30),
              alignment: AlignmentDirectional.center,
              width: 100,
              height: 50,
              child: isComplete && recordFilePath != null
                  ? Text(
                      "Send",
                      style: TextStyle(color: Colors.red, fontSize: 20),
                    )
                  : Container(),
            ),
          ),
          percent != null ? RoundedProgressBar(
            percent: percent,
            childCenter: Text("${percent.toStringAsFixed(2)} %"),
          ) : Container(),
          SizedBox(height: 20),
              GestureDetector(
                  child: Container(
                    width: 200,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade300),
                    child: Center(
                      child: Text(
                        '+20',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    stopRecord();
                  },
                ),
                SizedBox(height: 20),
              GestureDetector(
                  child: Container(
                    width: 200,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade300),
                    child: Center(
                      child: Text(
                        '+5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    stopRecord();
                  },
                ),
                SizedBox(height: 20),
              GestureDetector(
                  child: Container(
                    width: 200,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade300),
                    child: Center(
                      child: Text(
                        '-5',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    stopRecord();
                  },
                ),
                SizedBox(height: 20),
              GestureDetector(
                  child: Container(
                    width: 200,
                    height: 48.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green.shade300),
                    child: Center(
                      child: Text(
                        '-20',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    stopRecord();
                  },
                ),
        ]),
      ));
  }

}