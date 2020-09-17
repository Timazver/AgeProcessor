import 'dart:async';
import 'dart:io';
import 'package:age_processor/data/datastore/network/model/requests/info_request.dart';
import 'package:age_processor/data/datastore/network/model/requests/upload_request.dart';
import 'package:age_processor/data/repositories/auth/repository_impl.dart';
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:age_processor/ui/screens/result_screen.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:age_processor/ui/viewmodel/main_screen_viewmodel.dart';
import 'package:age_processor/ui/viewmodel/result_screen_viewmodel.dart';
import 'package:age_processor/ui/widgets/control_panel/control_panel.dart';
import 'package:age_processor/ui/widgets/main/text_block.dart';
import 'package:age_processor/ui/widgets/pro_sign.dart';
import 'package:age_processor/util/app_utils.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

enum RecordingStatus { INITIAL, RECORDING, SENDING, PAUSING, COMPLETE, RESUMING, PLAYING }

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ValueNotifier<RecordingStatus> statusText = ValueNotifier(RecordingStatus.INITIAL);
  int count = 0;
  bool isStopped = false;
  bool isComplete = false;
  String recordFilePath;
  AudioPlayer player;
  int i = 0;
  double percent;
  FlutterSoundRecorder _recorder;
  Timer timer;
  DateTime _currentDate;
  List<String> _weekDays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
  List<String> _months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  // FlutterSoundPlayer _player;

  @override
  initState() {
    super.initState();
    _currentDate = DateTime.now();
    print(_currentDate.weekday);
    _recorder = FlutterSoundRecorder();
    _recorder.openAudioSession().then((value) => {
      statusText.addListener(() {
      print(statusText.value);
    switch(statusText.value) {
      case RecordingStatus.INITIAL:
        break;
      case RecordingStatus.RECORDING:
        startRecord();
        break;
      case RecordingStatus.SENDING:
      stopRecord().then((value) => 
       MultipartFile.fromFile(recordFilePath, filename: "record.wav", contentType: MediaType("audio/mpeg", ".wav"))
       .then((value) => _viewModel.uploadRecord(UploadRequest(filePath: recordFilePath, multipartFile: value)))
      );
        break;
      case RecordingStatus.PAUSING:
        
        break;
      case RecordingStatus.COMPLETE:
        break;
      case RecordingStatus.RESUMING:
        // TODO: Handle this case.
        break;
      case RecordingStatus.PLAYING:
        playRecord();
        print(recordFilePath);
        break;
    }
    }
    )
    
    });
    // _player = FlutterSoundPlayer();
    _resultViewModel.stream.listen((value) {
      if(value.predicted_age != null) {
        timer.cancel();
        Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultScreen(
                            predicted_age: value.predicted_age, predicted_sex: value.predicted_sex)));
      }
    });

    _viewModel.basicRespStream.listen((value) {
      sec5Timer(value.security_code, value.id);
      setState(() {
                  reset();
              });
    }).onError((error) {
      AppUtils.showError(context, "Ошибка", error.toString());
    });
  }

  MainScreenViewmodel _viewModel =
      MainScreenViewmodel(repository: RepositoryImpl());
  ResultScreenViewmodel _resultViewModel = ResultScreenViewmodel(repository: RepositoryImpl());


  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  void reset() {
    Directory(recordFilePath).deleteSync(recursive: true);
                  // statusText.value = RecordingStatus.INITIAL;
                  recordFilePath = "";
                  isComplete = false;
                  percent = null;
  }

  void playRecord() async {
    AudioPlayer player = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
    int result = await player.play(recordFilePath, isLocal: true);
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      // statusText = RecordingStatus.RECORDING;
      recordFilePath = await getFilePath();
      isComplete = false;
      await _recorder.openAudioSession();
      await _recorder.startRecorder(
          codec: Codec.pcm16WAV, toFile: recordFilePath);
    } else {
    }
    setState(() {});
  }

   sec5Timer(String code, int id) {
    timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
         count++;
      });
      if(count >= 12) {
        timer.cancel();
        AppUtils.showError(context, "Ошибка", "Извините, произошла неизвестная ошибка. Попробуйте позднее.", onSubmit: () => {
          Navigator.pop(context),
          setState(() {
            statusText.value = RecordingStatus.INITIAL;
          }),
          reset()
        });
      }
      _resultViewModel.getInfo(InfoRequest(code: code, id: "$id"));
   });
  }


  Future<void> stopRecord() async {
    await _recorder.stopRecorder();
    isComplete = true;
    await _recorder.closeAudioSession();
    print(_recorder.isStopped);
    setState(() {});
    return;
  }

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_record${i++}.wav";
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(children: [
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("${_weekDays[_currentDate.weekday - 1]}, ${_currentDate.day} ${_months[_currentDate.month - 1]}", style: CustomTextStyle.dateTitle),
              ProSign()
            ]),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Test your voice",
                    style: CustomTextStyle.screenTitle)),
            SizedBox(height: 20),
            Container(
              height: height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // gradient: CustomColors.bGGradient,
                image: DecorationImage(image: AssetImage("assets/images/bg.png"), fit: BoxFit.fitWidth)
              ),
              width: MediaQuery.of(context).size.width,
              child: Center(child: Container(
                height: height * 0.5,
                 decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient:  CustomColors.bGGradient,
              ),
                child: Center(child: TextBlock())
              ),
            )),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ControlPanel(
              status: statusText.value,
              onTap: (status) => {
                setState(() {
                  statusText.value = status;
                })
              },
            )),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 23),
              child: Center(
                child: Text("Powered by AgeProcessor AI",
                    style: CustomTextStyle.textBlockSubtitle)))
          ]),
        ))));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
