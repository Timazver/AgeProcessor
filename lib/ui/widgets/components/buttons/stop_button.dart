
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopButton extends StatelessWidget {

  final void Function() onTap;

  StopButton({this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
            color: CustomColors.stopButtonRed,
            shape: BoxShape.circle
          ),
        child: Center(child: Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: CustomColors.stopButtonBlack,
            shape: BoxShape.circle
          ),
          child: Center(child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: CustomColors.stopButtonRed,
            shape: BoxShape.circle
          ),
        )
        ))
      ))
    );
  }

}