
import 'dart:async';

import 'package:age_processor/ui/screens/main_screen.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:age_processor/ui/widgets/components/buttons/black_button.dart';
import 'package:age_processor/ui/widgets/components/buttons/stop_button.dart';
import 'package:flutter/material.dart';

class RecordingTimer extends StatefulWidget {

  final void Function(RecordingStatus) onTap;

  RecordingTimer({this.onTap});
  
  @override
  State<StatefulWidget> createState() => _RecordingTimerState();

}

class _RecordingTimerState extends State<RecordingTimer> with SingleTickerProviderStateMixin {

  Timer _timer;
  int _start = 0;
  String _buttonTitle = "00:00";
  AnimationController _controller;
  // int _currentWidget = 0;
  bool isRecordBtnShown = true;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this
    );
    // _controller.forward(from.);
    _startTimer();
  }

  void _startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
        () {
          isRecordBtnShown = !isRecordBtnShown;
          _start++;
          if(_start >= 0 && _start < 10) {
            _buttonTitle = "00:0$_start";
          } else if(_start >= 60) {
            timer.cancel();
            widget.onTap(RecordingStatus.SENDING);
          } else {
            _buttonTitle = "00:$_start";
          }
        }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlackButton(
      onTap: () => {
        _timer.cancel(),
        widget.onTap(RecordingStatus.SENDING)
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          isRecordBtnShown ? StopButton(
            onTap: () => {
              
            }
          ) : Container(width: 26, height: 26),
          Text(_buttonTitle, style: CustomTextStyle.timerTitle)
        ],
      ),
    );
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }


}