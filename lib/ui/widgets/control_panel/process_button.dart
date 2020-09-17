import 'dart:async';

import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:flutter/material.dart';

class ProcessButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProcessButtonState();
}

class _ProcessButtonState extends State<ProcessButton> {
  double _value = 0;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 17),
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14), color: Colors.white),
              child: Center(
                  child: Container(
                    height: 15,
                    color: Colors.black,
                    padding: EdgeInsets.all(5),
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      value: _value))))),
      SizedBox(height: 13),
      Text("Processing...", style: CustomTextStyle.processingText)
    ]);
  }

  void _startTimer() {
    print(_value);
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(() {
        _value += 0.022;
        if (_value >= 1.0) {
          print("Above");
          _timer.cancel();
        }
      }),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
