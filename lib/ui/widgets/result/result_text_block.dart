
import 'package:age_processor/ui/colors/custom_colors.dart';
import 'package:age_processor/ui/styles/custom_textstyle.dart';
import 'package:flutter/material.dart';

class ResultTextBlock extends StatelessWidget {
  
  final String sex;
  final String age;

  ResultTextBlock({this.age, this.sex});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
      width: 300,
      height: 257,
      decoration: BoxDecoration(
        gradient: CustomColors.resultTextBlockGradient,
        border: Border.all(style: BorderStyle.solid, color: CustomColors.textBlockBorder, width: 1),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 30, right: 10, top: 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Your results", style: CustomTextStyle.resultTextBlockTitle),
          SizedBox(height: 40),
          Text("Predicted sex: $sex", style: CustomTextStyle.resultTextBlockContent),
          Text("Predicted age: $age", style: CustomTextStyle.resultTextBlockContent),
          Spacer(),
          Padding(padding: EdgeInsets.only(bottom: 10), child: Text("Please provide us feedback by pushing button below", style: 
          CustomTextStyle.resultBlockFooterText
          ))
        ]
      ))
    )));
  }

}