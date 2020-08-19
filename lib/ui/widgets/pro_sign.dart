
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:flutter/material.dart';

class ProSign extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 43,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CustomColors.proSignBg
      ),
      child: Center(
        child: Text("PRO", style: CustomTextStyle.proSignTitle)
      )
    );
  }

}