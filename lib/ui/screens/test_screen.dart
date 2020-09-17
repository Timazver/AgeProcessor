
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';

class TestScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Container(
        height: 100,
        width: 200,
        child: SoundPlayerUI.fromTrack(Track())
      ))
    );
  }

}