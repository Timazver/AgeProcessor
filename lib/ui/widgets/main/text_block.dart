
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
      width: 300,
      height: 260,
      decoration: BoxDecoration(
        gradient: CustomColors.textBlockGradient,
        border: Border.all(style: BorderStyle.solid, color: CustomColors.textBlockBorder, width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("For testing you can use following text", style: CustomTextStyle.textBlockTitle),
          Text("push the button below and read it outloud", style: CustomTextStyle.textBlockSubtitle),
          SizedBox(height: 20),
          Text("I live in a house near the\nmountains. I have two \nbrothers and one sister, and I \nwas born last. My father \nteaches mathematics, and \nmy mother is a nurse at a big \nhospital.", style: CustomTextStyle.resultTextBlockContent)
        ]
      )
    )));
  }

}